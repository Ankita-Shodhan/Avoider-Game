package 
{
	import flash.display.MovieClip;

	public class Enemy extends MovieClip
	{
		public var xSpeed:Number;	//pixels moved to the right per clock interval
		public var ySpeed:Number;	//pixels moved downwards per clock interval
		 
		public function Enemy(_x:Number,_y:Number)
		{
			this.x = _x;
			this.y = _y;
			
			xSpeed = Math.random()*3- Math.random()*4 ;
			ySpeed = Math.random()*5;
		}

		public function moveDown():void
		{
			x = x + xSpeed;
			y = y + ySpeed;
		}
	}
}