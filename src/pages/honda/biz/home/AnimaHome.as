package pages.honda.biz.home 
{
	import com.greensock.easing.Cubic;
	import com.greensock.TweenMax;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Edson Prata Ishii
	 */
	public class AnimaHome extends MovieClip
	{
		public var nova :MovieClip;
		public var texto :MovieClip;
		public var txt_125 :MovieClip;
		public var biz :MovieClip;
		public var balao :MovieClip;
		public var fundo :MovieClip;
		
		public var blabla :MovieClip;
		
		
		
		private var arrayBts:Array;
		private var range:Number = 10 ;
		
		public function AnimaHome():void
		{
			super();
			blabla.visible = false;
		}
		
		public function animaHome() :void
		{
			addEventListener(Event.ENTER_FRAME, render );
			
			arrayBts = new Array(blabla);
			//arrayBts = new Array(nova, texto, txt_125, biz, balao, fundo);
			
			for (var i:int = 0; i < arrayBts.length; i++) 
			{
				arrayBts[i].initialPos 	= new Point( arrayBts[i].x - range , arrayBts[i].y - range );
				arrayBts[i].finalPos 	= new Point( arrayBts[i].x + range , arrayBts[i].y + range );
				
				flutuaBt( arrayBts[i] , i * 0.2 );
			}
		}
		private function render(e:Event):void 
		{
			var divisor:Number = 20 ;
			
			//TweenMax.to( nova, 1, { rotationY:nova.mouseX / divisor , rotationX:nova.mouseY / divisor } );
			//TweenMax.to( texto, 1, { rotationY:texto.mouseX / divisor , rotationX:texto.mouseY / divisor } );
			//TweenMax.to( txt_125, 1, { rotationY:txt_125.mouseX / divisor , rotationX:txt_125.mouseY / divisor } );
			//TweenMax.to( biz, 1, { rotationY:biz.mouseX / divisor , rotationX:biz.mouseY / divisor } );
			//TweenMax.to( balao, 1, { rotationY:balao.mouseX / divisor , rotationX:balao.mouseY / divisor } );
			//TweenMax.to( fundo, 1, { rotationY:fundo.mouseX / divisor , rotationX:fundo.mouseY / divisor } );
			
			TweenMax.to( blabla, 1, { rotationY:blabla.mouseX / divisor , rotationX:blabla.mouseY / divisor } );
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
		
	}

}