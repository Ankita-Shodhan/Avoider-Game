package 
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Mouse;
	import flash.media.SoundChannel;
	
	public class GameOverScreen extends MovieClip 
	{
		private var gameFinishMusic:GameOverMusic;
		private var gameFinishChannel:SoundChannel;
		
		public function GameOverScreen() 
		{
			Mouse.show();					// To make the mouse reappear on the screen
			restartButton.addEventListener( MouseEvent.CLICK, onClickRestart );
			gameFinishMusic = new GameOverMusic();
	        gameFinishChannel = gameFinishMusic.play();
		}
 
		public function onClickRestart( mouseEvent:MouseEvent ):void
		{
			gameFinishChannel.stop();
			dispatchEvent( new IntermediateEvent( IntermediateEvent.RESTART ) );
		}
		
		public function setFinalScore( scoreValue:Number ):void
		{
			finalScore.text = scoreValue.toString();
		}
		
		public function setGamePlayedTime( clockValue:Number ):void
		{
			gamePlayedTime.text = clockValue.toString();
		}
	}
}