package 
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.media.SoundChannel;
	import flash.events.*;
	import flash.ui.Mouse;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import PixelPerfectCollisionDetection; 		// Instead Of using Array complication involved in CDK I'm just using a ReadyMade code given by Troy Gilbert in his Mocking Bird Game
	import Level;
	
	/**
	 * This is the main Player Class. It has intances of Player, Enemy Class Created.
	 * @author: Ankita Mehta
	 */
	
	public class AvoiderGame extends MovieClip 
	{
		
		private var enemies:Array;
		private var player:Player;
		private var timer:Timer;
		private var gameOverScreen:GameOverScreen;
		private var noOfEnemy:Number=10;
		private var enemy:Enemy;
		private var musicBackground:BackdropMusic;
		private var musicChannel:SoundChannel;
		private var flag:Number;
		public var gamePlayedTime: Number;
		private var currentLevel:Number;
		public var level:Level;
		private static var previousStageW:int;
		private static var previousStageH:int;
		
		public function AvoiderGame() 
		{
		    addEventListener(Event.ADDED_TO_STAGE, initAvoiderGame);
		}
		
		public function initAvoiderGame(e:Event):void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			init();
			stage.addEventListener(Event.RESIZE, resizeHandler);
			
		}
		
		public function init():void 
		{
 			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			
			this.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			Mouse.hide();						// To make the mouse disappear on the screen
			enemies = new Array();
			player = new Player();
			addChild( player );
			
			level =new Level();
			currentLevel=1;
			levelDisplay.levelDisp.text = level.LevelDisplay(currentLevel);
			
			flag=0;
			gamePlayedTime=0;
			
			musicBackground = new BackdropMusic();
	        musicChannel = musicBackground.play();
			musicChannel.addEventListener( Event.SOUND_COMPLETE, onMusicFinished );
			
			timer = new Timer(50);
			timer.addEventListener( TimerEvent.TIMER, onEachTick );
			timer.start();
			
		}
		private function onEnterFrame(e:Event):void
		{
			
			if(player)
			{
				player.x = mouseX;
				player.y = mouseY;
			}
			
			//Player Stays Inside the Boundries
			if ( player.x <( player.width / 2 ) )
			{
				player.x = player.width / 2;
			}
			if ( player.x > 1024 - ( player.width / 2 ) )
			{
				player.x = 1024 - ( player.width / 2 );
			}
			if ( player.y < ( player.height / 2 ) )
			{
				player.y = player.height / 2;
			}
			if ( player.y > 768 -( player.height / 2 ) )
			{
				player.y = 768 - ( player.height / 2 );
			}
			
			flag++;
			if(flag == 24)
			{
				flag=0;
				gamePlayedTime++; 
			}
				
		
		}
		
		private function resizeHandler(e:Event):void 
		{
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			previousStageW = stage.stageWidth;
			previousStageH = stage.stageHeight;
		}
		
		private function onEachTick( timerEvent:TimerEvent ):void 
		{
 			if ( score.currentValue >= level.PointsToReachNextLevel(this.currentLevel))
			{
				currentLevel++;
     			levelDisplay.levelDisp.text = level.LevelDisplay(currentLevel);
			}
			
			if ( Math.random() < level.EnemyCount(currentLevel))
			{
				var randomX:Number = Math.random() * 1000;
				var newEnemy:Enemy = new Enemy( randomX, 50 );
				enemies.push( newEnemy );
				addChild( newEnemy );
				score.addToValue( 10 );
				score.updateText();
			}
			var i:int = enemies.length - 1;
			// Check For Collision
			/*for each ( enemy in enemies ) 
			{*/
			while ( i > -1 )
			{
				enemy = enemies[i];
				enemy.moveDown();
				if ( PixelPerfectCollisionDetection.isColliding( player, enemy, this, true ) )
				{
					timer.stop();
					musicChannel.stop();
					dispatchEvent( new GameOverEvent( GameOverEvent.DEAD ) );
				}
				// If Enemy goes out of Boundaries  
				if ( enemy.y > 768 + enemy.height/2 || enemy.x > 1024 - enemy.width/2 || enemy.x < enemy.width/2)
				{
					removeChild( enemy );
					enemies.splice( i, 1 );				//remove enemy here
				}
				
				i = i - 1;

			}
			
		}
		
		public function onMusicFinished( e:Event ):void
		{
			musicChannel= musicBackground.play();
			musicChannel.addEventListener( Event.SOUND_COMPLETE, onMusicFinished );
		}
		
		public function getFinalScore():Number
		{
			return score.currentValue;
		}
		
		public function getGamePlayedTime():Number
		{
			return gamePlayedTime;
		
		}
}

}