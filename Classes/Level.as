package
{
	public class Level
	{
		public var pointsToReachNextLevel:Number;
 		public var enemyCount:Number;
 
		public function Level()
		{
		}
		
		public function PointsToReachNextLevel( levelNumber:Number ):Number
		{
			switch(levelNumber)
			{
				case 1:return pointsToReachNextLevel = 150;
			    
				case 2:return pointsToReachNextLevel = 400;
				
				case 3:return pointsToReachNextLevel = 1000;
				
				default: return 0;
				
			}
		}
		
		public function EnemyCount( levelNumber:Number ):Number
		{
			switch(levelNumber)
			{
				case 1:return enemyCount=0.1;
			    
				case 2:return enemyCount=0.2;
				
				case 3:return enemyCount=0.3;
				
				default: return 0;
				
			}
		}
		
		public function LevelDisplay(levelNumber:Number):String
		{
			var s:String;
			
			switch(levelNumber)
			{
				case 1:return s = "*";
			    
				case 2:return s = "**";
				
				case 3:return s = "***";
				
				default: return s = "*";
				
			}
			
		}
	
	}
}