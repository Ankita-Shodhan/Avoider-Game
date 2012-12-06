package
{
	import flash.text.TextField;
	public class Score extends Game
	{
		public function Score()
		{
 			super();
		}
		
		public function updateText():void
		{
			//super.updateDisplay();
			scoreTxt.text = currentValue.toString();
		}
	}
}