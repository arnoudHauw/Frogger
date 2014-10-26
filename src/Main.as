package
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author arnoud
	 */
	public class Main extends Sprite
	{
		private var logs:Logs = new Logs();
		private var frog:Frog = new Frog;
		private var backGround:BackGround = new BackGround;
		
		private var carList:Array = [];
		private var amountCars:int = 5;
		
		public function Main():void
		{
			if (stage)
				init()
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			addChild(backGround);
			addChild(logs);
			addChild(frog);
			
			backGround.x = 112;
			backGround.y = 128;
			backGround.scaleX = 0.4;
			backGround.scaleY = 0.45;
			
			for (var i:int = 0; i < amountCars; i++)
			{
				var car:Car = new Car();
				addChild(car);
				carList.push(car);
				car.counter = i;
			}
			
			var carsLength:int = carList.length;
			for (var j:int = 0; j < carsLength; j++)
			{
				carList[0].x = 112;
				carList[0].y = 228;
				
				carList[1].x = carList[0].x;
				carList[1].y = carList[0].y - 18;
				
				carList[2].x = carList[0].x;
				carList[2].y = carList[1].y - 18;
				
				carList[3].x = carList[0].x;
				carList[3].y = carList[2].y - 18;
				
				carList[4].x = carList[0].x;
				carList[4].y = carList[3].y - 18;
				
				carList[j].scaleX = 0.4;
				carList[j].scaleY = 0.4;
			}
			
			frog.x = 112;
			frog.y = 128;
			frog.scaleX = 0.4;
			frog.scaleY = 0.4;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			stage.addEventListener(Event.ENTER_FRAME, Loop);
		
		}
		
		private function Loop(e:Event):void
		{
			carList[0].x += 1;
			carList[1].x += 2;
			carList[2].x -= 3;
			carList[3].x += 1;
			carList[4].x -= 2.5;
			
			if (carList[0].x > 240)
			{
				carList[0].x = 0;
			}
			else if (carList[1].x > 240)
			{
				carList[1].x = 0;
			}
			else if (carList[4].x < -20)
			{
				carList[4].x = 240;
			}
			else if (carList[2].x < 0)
			{
				carList[2].x = 240;
			}
			else if (carList[3].x > 240)
			{
				carList[3].x = 0;
			}
			
			if (frog.hitTestObject(carList[1] || carList[2] || carList[3] || carList[4] || carList[5]))
			{
				frog.x = 110;
				frog.y = 245;
			}
		}
		
		private function keyUp(e:KeyboardEvent):void
		{
		
		}
		
		private function keyDown(e:KeyboardEvent):void //Movement function
		{
			if (e.keyCode == 38) //omlaag
			{
				frog.y -= 20;
				frog.rotation = 0;
					//frog.gotoAndPlay(Frog);
			}
			if (e.keyCode == 40) //Omho
			{
				frog.y += 20;
				frog.rotation = 180;
			}
			if (e.keyCode == 39) //rechts
			{
				frog.x += 18;
				frog.rotation = 90;
			}
			if (e.keyCode == 37) //links
			{
				frog.x -= 18;
				frog.rotation = -90;
			}
		
		}
	
	}

}