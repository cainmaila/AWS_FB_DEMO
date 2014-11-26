package 
{
	//import Cain.javaScript.JavaSP;
	import Cain.As3;
	import Cain.MkMc.Bk;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.external.ExternalInterface;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author cainmaila@gmail.com
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			if (ExternalInterface.available) 
			{
				ExternalInterface.marshallExceptions = true;
				ExternalInterface.addCallback("ok", ok);
			}
			
			As3.clickFun(stage,function ():void 
			{
				if (ExternalInterface.available) 
				{
					ExternalInterface.call("fb_in");
				}
			})
			
		}
		
		public function ok(value:String):void 
		{
			addChild(new Bk(200, 200));
			var _txt:TextField = new TextField();
			_txt.width = 500;
			_txt.text = value;
			_txt.y = 230;
			addChild(_txt);
		}
		
	}
	
}