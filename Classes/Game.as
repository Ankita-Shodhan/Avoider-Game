package
{
	import flash.display.MovieClip;
	public class Game extends MovieClip
	{
		public var currentValue:Number;
 
		public function Game()
		{
 			reset();
		}
 
		public function addToValue( amountToAdd:Number ):void
		{
 			currentValue = currentValue + amountToAdd;
			
		}
 
		public function reset():void
		{
 			currentValue = 0;

		}
 
		
	}
}