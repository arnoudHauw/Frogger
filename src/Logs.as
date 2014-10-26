package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author arnoud
	 */
	public class Logs extends Sprite
	{
		private var log : Log = new Log;
		public function Logs() 
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			//log.hitTestObject();
		}
		
	}

}