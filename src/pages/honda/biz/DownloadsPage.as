package pages.honda.biz
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import com.greensock.easing.Cubic;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	import flash.geom.Point;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	public class DownloadsPage extends AbstractPage
	{	
		public var wallpaper	:MovieClip;
		public var screensaver	:MovieClip;
		public var btScreensaver:MovieClip;
		public var bt1			:MovieClip;
		public var bt2			:MovieClip;
		public var bt3			:MovieClip;
		public var bt4			:MovieClip;
		
		public var strokeScreen	:MovieClip;
		public var strokeWall	:MovieClip;
		
		private var arrayBts:Array;
		private var range:Number = 20 ;
		
		public function DownloadsPage()
		{
			super();
			alpha = 0;
			
			screensaver.buttonMode = btScreensaver.buttonMode = bt1.buttonMode = bt2.buttonMode = bt3.buttonMode = bt4.buttonMode = true;
			
			strokeScreen.mouseEnabled = false;
			strokeWall.mouseEnabled = false;
			
			btScreensaver.addEventListener(MouseEvent.CLICK, downloadScreensaverHandler);
			screensaver.addEventListener(MouseEvent.CLICK, downloadScreensaverHandler);
			
			bt1.addEventListener(MouseEvent.CLICK, downloadWallpaperHandler);
			bt2.addEventListener(MouseEvent.CLICK, downloadWallpaperHandler);
			bt3.addEventListener(MouseEvent.CLICK, downloadWallpaperHandler);
			bt4.addEventListener(MouseEvent.CLICK, downloadWallpaperHandler);
			
			
			bt1.addEventListener(MouseEvent.MOUSE_OUT, outHandler);
			bt2.addEventListener(MouseEvent.MOUSE_OUT, outHandler);
			bt3.addEventListener(MouseEvent.MOUSE_OUT, outHandler);
			bt4.addEventListener(MouseEvent.MOUSE_OUT, outHandler);
			wallpaper.addEventListener(MouseEvent.MOUSE_OUT, outHandler);
			screensaver.addEventListener(MouseEvent.MOUSE_OUT, outScreenHandler);
			btScreensaver.addEventListener(MouseEvent.MOUSE_OUT, outScreenHandler);
			
			bt1.addEventListener(MouseEvent.MOUSE_OVER, overHandler);
			bt2.addEventListener(MouseEvent.MOUSE_OVER, overHandler);
			bt3.addEventListener(MouseEvent.MOUSE_OVER, overHandler);
			bt4.addEventListener(MouseEvent.MOUSE_OVER, overHandler);
			wallpaper.addEventListener(MouseEvent.MOUSE_OVER, overHandler);
			screensaver.addEventListener(MouseEvent.MOUSE_OVER, overScreenHandler);
			btScreensaver.addEventListener(MouseEvent.MOUSE_OVER, overScreenHandler);
		}
		
		public function animaHome() :void
		{
			addEventListener(Event.ENTER_FRAME, render );
			
			arrayBts = new Array(wallpaper, screensaver, strokeWall, strokeScreen);
			
			for (var i:int = 0; i < arrayBts.length; i++) 
			{
				arrayBts[i].initialPos 	= new Point( arrayBts[i].x - range , arrayBts[i].y - range );
				arrayBts[i].finalPos 	= new Point( arrayBts[i].x + range , arrayBts[i].y + range );
				
				flutuaBt( arrayBts[i] , i * 0.2 );
			}
		}
		private function render(e:Event):void 
		{
			var divisor:Number = 30 ;
			
			TweenMax.to( wallpaper, 1, { rotationY:wallpaper.mouseX / divisor , rotationX:wallpaper.mouseY / divisor } );
			TweenMax.to( screensaver, 1, { rotationY:screensaver.mouseX / divisor , rotationX:screensaver.mouseY / divisor } );
			TweenMax.to( strokeWall, 1, { rotationY:strokeWall.mouseX / divisor , rotationX:strokeWall.mouseY / divisor } );
			TweenMax.to( strokeScreen, 1, { rotationY:strokeScreen.mouseX / divisor , rotationX:strokeScreen.mouseY / divisor } );
		}
		
		private function flutuaBt(qualBt:MovieClip , delayTime:Number = 1 ):void 
		{
			TweenMax.to( qualBt, 3 , { 	x:randRange( qualBt.initialPos.x , qualBt.finalPos.x ) , 
										y:randRange( qualBt.initialPos.y , qualBt.finalPos.y ), 
										onComplete:flutuaBt, onCompleteParams:[qualBt,0], 
										ease:Cubic.easeInOut, delay:delayTime } );
		}
		
		private function randRange(minNum:Number, maxNum:Number):Number {
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
		
		private function overScreenHandler(e:MouseEvent):void 
		{
			TweenMax.to(screensaver, .5, { frame:20 } );
		}
		
		private function outScreenHandler(e:MouseEvent):void 
		{
			TweenMax.to(screensaver, .5, { frame:1 } );
		}
		
		private function outHandler(e:MouseEvent):void 
		{
			TweenMax.to(e.currentTarget, .5, { frame:1 } );
			TweenMax.to(wallpaper, .5, { frame:1 } );
		}
		
		private function overHandler(e:MouseEvent):void 
		{
			TweenMax.to(e.currentTarget, .5, { frame:10 } );
			TweenMax.to(wallpaper, .5, { frame:10 } );
		}
		
		private function downloadWallpaperHandler(e:MouseEvent):void 
		{
			switch (e.currentTarget.name) 
			{
				case "bt1":
					navigateToURL(new URLRequest("images/downloads/wallpaper1024.jpg"), "_blank");
				break;
				
				case "bt2":
					navigateToURL(new URLRequest("images/downloads/wallpaper1280.jpg"), "_blank");
				break;
				
				case "bt3":
					navigateToURL(new URLRequest("images/downloads/wallpaper1440.jpg"), "_blank");
				break;
				
				case "bt4":
					navigateToURL(new URLRequest("images/downloads/wallpaper1600.jpg"), "_blank");
				break;
			}
		}
		
		private function downloadScreensaverHandler(e:MouseEvent):void 
		{
			navigateToURL(new URLRequest("images/downloads/screensaver.zip"), "_blank");
		}
		
		override public function transitionIn():void 
		{
			super.transitionIn();
			TweenMax.to(this, 1.3, { alpha:1, onComplete:transitionInComplete } );
		}
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 0.5, {alpha:0, onComplete:transitionOutComplete});
		}
	}
}
