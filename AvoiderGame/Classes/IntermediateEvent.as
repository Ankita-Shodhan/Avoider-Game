package  
{
	import flash.events.Event;
	public class IntermediateEvent extends Event 
	{
		public static const RESTART:String = "restart";
		public static const START:String = "start";
 
		public function IntermediateEvent( type:String )
		{
			super( type );
		}
	}
}