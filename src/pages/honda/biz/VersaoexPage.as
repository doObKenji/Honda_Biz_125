package pages.honda.biz
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import com.greensock.easing.Cubic;
	import com.gustavofelizola.display.ButtonMovieClip;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	import flash.geom.Point;
	import pages.honda.biz.versaoex.ImagemAmpliadaVersao;
	import pages.honda.biz.versaoex.VersaoEvent;
	
	public class VersaoexPage extends AbstractPage
	{	
		private var imagemAmpliada	:ImagemAmpliadaVersao;
		
		public var foto1			:MovieClip;
		public var foto2			:MovieClip;
		public var foto3			:MovieClip;
		
		private var arrayBt			:Array;
		private var arrayURL		:Array;
		
		public function VersaoexPage()
		{
			super();
			arrayBt = new Array(foto1, foto2, foto3);
			
			arrayURL = new Array();
			arrayURL.push("images/versao/roda.jpg");
			arrayURL.push("images/versao/cores.jpg");
			arrayURL.push("images/versao/freio.jpg");
			
			for (var i:int = 0; i < arrayBt.length; i++) 
			{
				arrayBt[i].url = arrayURL[i];
				ButtonMovieClip.addButtonEvents( arrayBt[i] , ButtonMovieClip.FRONT, { time: arrayBt[i].totalFrames / 30 } , imagemClicadaHandler );
			}
			//alpha = 0;
			//new Scaffold(this);
			animaVersao();
		}
		
		private function imagemClicadaHandler(e:MouseEvent):void 
		{
			imagemAmpliada = new ImagemAmpliadaVersao();
			imagemAmpliada.addEventListener(VersaoEvent.FECHA_IMAGEM_AMPLIADA, fechaImagemAmpliadaHandler);
			imagemAmpliada.urlFoto = e.currentTarget.url;
			imagemAmpliada.alpha = 0;
				
			addChild(imagemAmpliada);
				
			TweenMax.to(imagemAmpliada, .5, { alpha:1, ease:Cubic.easeInOut } );
		}
		
		private function fechaImagemAmpliadaHandler(e:VersaoEvent):void 
		{
			TweenMax.to(imagemAmpliada, .3, { alpha:0, ease:Cubic.easeInOut, onComplete:removeImagemAmpliada } );
		}
		
		private function removeImagemAmpliada():void 
		{
			removeChild(imagemAmpliada);
		}
		
		public function animaVersao() :void
		{
			addEventListener(Event.ENTER_FRAME, render );
			
			var range:Number = 20 ;
			
			for (var i:int = 0; i < arrayBt.length; i++) 
			{
				arrayBt[i].initialPos 	= new Point( arrayBt[i].x - range , arrayBt[i].y - range );
				arrayBt[i].finalPos 	= new Point( arrayBt[i].x + range , arrayBt[i].y + range );
				
				flutuaBt( arrayBt[i] , i * 0.2 );
			}
		}
		private function render(e:Event):void 
		{
			var divisor:Number = 30 ;
			
			TweenMax.to( foto1, 1, { rotationY:foto1.mouseX / divisor , rotationX:foto1.mouseY / divisor } );
			TweenMax.to( foto2, 1, { rotationY:foto2.mouseX / divisor , rotationX:foto2.mouseY / divisor } );
			TweenMax.to( foto3, 1, { rotationY:foto3.mouseX / divisor , rotationX:foto3.mouseY / divisor } );
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
		
		override public function transitionIn():void 
		{
			super.transitionIn();
			TweenMax.to(this, 0.3, {alpha:1, onComplete:transitionInComplete});
		}
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 0.3, {alpha:0, onComplete:transitionOutComplete});
		}
	}
}
