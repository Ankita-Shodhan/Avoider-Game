package 
{
	import flash.display.MovieClip;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.*;
	
	/**
	 * This is the main Contoller Class. It creates Menu Secreen, 
	 *  redirects to Play Screen and if game finishes dislays Game Over Screen.
	 * @author: Ankita Mehta
	 */
	 
	public class DocumentClass extends MovieClip 
	{
		public var playScreen:AvoiderGame;
		public var menuScreen:MenuScreen;
		public var gameOverScreen:GameOverScreen;
		 
		public function DocumentClass() 
		{
			menuScreen = new MenuScreen();
			menuScreen.addEventListener( IntermediateEvent.START, onStartRequest );
			menuScreen.x = 0;
			menuScreen.y = 0;
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			menuScreen.width = stage.stageWidth;
			menuScreen.height = stage.stageHeight;
			addChild( menuScreen );
			
			stage.addEventListener(Event.RESIZE, resizeMenuHandler);
		}
				
		public function onGameOver( gameOverEvent:GameOverEvent ):void
		{
			var finalScore:Number = playScreen.getFinalScore(); 
			var finalClockTime:Number = playScreen.getGamePlayedTime();
			removeChild( playScreen );
			playScreen = null;
			menuScreen=null;
 			gameOverScreen = new GameOverScreen();
			gameOverScreen.addEventListener( IntermediateEvent.RESTART, onRestartRequest)
			gameOverScreen.x = 0;
			gameOverScreen.y = 0;
			
			gameOverScreen.width = stage.stageWidth;
			gameOverScreen.height = stage.stageHeight;
			
			gameOverScreen.setFinalScore( finalScore );
			gameOverScreen.setGamePlayedTime( finalClockTime);
			addChild( gameOverScreen );
			stage.addEventListener(Event.RESIZE, resizeGameOverScreenHandler);
	 
		}
		
		public function onStartRequest( intermediateEvent:IntermediateEvent ):void
		{
			playScreen = new AvoiderGame();
			playScreen.addEventListener( GameOverEvent.DEAD, onGameOver );
			addChild( playScreen );
		 	removeChild( menuScreen );
			menuScreen = null;
 
			/*stage.focus = playScreen;
			stage.stageFocusRect = false;*/
		}
		public function restartGame():void
		{
			playScreen = new AvoiderGame();
			playScreen.addEventListener( GameOverEvent.DEAD, onGameOver );
			playScreen.x = 0;
			playScreen.y = 0;
			addChild( playScreen );
 			gameOverScreen = null;
		}
		
		private function resizeMenuHandler(e:Event):void 
		{
			menuScreen.width = stage.stageWidth;
			menuScreen.height = stage.stageHeight;
		}
		private function resizeGameOverScreenHandler(e:Event):void 
		{
			gameOverScreen.width = stage.stageWidth;
			gameOverScreen.height = stage.stageHeight;
		}
		
		public function onRestartRequest(intermediateEvent:IntermediateEvent):void
		{
			restartGame();
		}
		
		
	}
}
