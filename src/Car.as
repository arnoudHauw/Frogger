package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author arnoud
	 */
	public class Car extends Sprite
	{
		private var asset1:Car_1 = new Car_1();
		private var asset2:Car_2 = new Car_2();
		private var asset3:Car_3 = new Car_3();
		private var asset4:Car_4 = new Car_4();
		private var asset5:Car_5 = new Car_5();
		public  var counter:int = 0;
		public function Car() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry pointhhhh
			
			addEventListener(Event.ENTER_FRAME, instantiateSprites);
		}
		
		public function instantiateSprites(e:Event):void 
		{
			if (counter == 1) { addChild(asset2); }
			else if (counter == 2) { addChild(asset4); }
			else if (counter == 3) { addChild(asset5); }
			else if (counter == 4) { addChild(asset3); }
			else { addChild(asset1); }
		}
		
	}
	

}