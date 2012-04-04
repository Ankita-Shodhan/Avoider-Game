package  
{
	import flash.events.Event;
	public class GameOverEvent extends Event 
	{
		public static const DEAD:String = "Game Over";
 
		public function GameOverEvent( type:String )
		{
			super( type );
		}
	}
}