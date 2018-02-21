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
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import pages.honda.biz.galeria.GaleriaEvent;
	import pages.honda.biz.galeria.ImagemAmpliada;
	
	public class GaleriaPage extends AbstractPage
	{
		private var imagemAmpliada	:ImagemAmpliada;
		public var foto1			:MovieClip;
		public var foto2			:MovieClip;
		public var foto3			:MovieClip;
		public var foto4			:MovieClip;
		public var foto5			:MovieClip;
		public var foto6			:MovieClip;
		
		private var arrayURLDownload:Array;
		private var arrayURL		:Array;
		private var arrayFotos		:Array;
		
		public function GaleriaPage()
		{
			super();
			alpha = 0;
			addEventListener(Event.ADDED_TO_STAGE, inicializa);
		}
		
		private function inicializa(e:Event):void 
		{
			arrayFotos = new Array(foto1, foto2, foto3, foto4, foto5, foto6);
			//teste
			arrayURL = new Array();
			arrayURL.push("images/galeria/medium/1.jpg");
			arrayURL.push("images/galeria/medium/2.jpg");
			arrayURL.push("images/galeria/medium/3.jpg");
			arrayURL.push("images/galeria/medium/4.jpg");
			arrayURL.push("images/galeria/medium/5.jpg");
			arrayURL.push("images/galeria/medium/6.jpg");
			
			arrayURLDownload = new Array();
			arrayURLDownload.push("images/galeria/full/1.jpg");
			arrayURLDownload.push("images/galeria/full/2.jpg");
			arrayURLDownload.push("images/galeria/full/3.jpg");
			arrayURLDownload.push("images/galeria/full/4.jpg");
			arrayURLDownload.push("images/galeria/full/5.jpg");
			arrayURLDownload.push("images/galeria/full/6.jpg");
			
			for (var i:int = 0; i < arrayFotos.length; i++) 
			{
				arrayFotos[i].buttonMode = true;
				arrayFotos[i].url = arrayURL[i];
				arrayFotos[i].urlDownload = arrayURLDownload[i];
				//arrayFotos[i].addEventListener(MouseEvent.CLICK, imagemClicadaHandler);
				ButtonMovieClip.addButtonEvents( arrayFotos[i] , ButtonMovieClip.FRONT, { time: arrayFotos[i].totalFrames / 30 } , imagemClicadaHandler );
			}
		}
		
		public function animaGaleria() :void
		{
			addEventListener(Event.ENTER_FRAME, render );
			
			var range:Number = 20 ;
			
			for (var i:int = 0; i < arrayFotos.length; i++) 
			{
				arrayFotos[i].initialPos 	= new Point( arrayFotos[i].x - range , arrayFotos[i].y - range );
				arrayFotos[i].finalPos 	= new Point( arrayFotos[i].x + range , arrayFotos[i].y + range );
				
				flutuaBt( arrayFotos[i] , i * 0.2 );
			}
		}
		private function render(e:Event):void 
		{
			var divisor:Number = 30 ;
			
			TweenMax.to( foto1, 1, { rotationY:foto1.mouseX / divisor , rotationX:foto1.mouseY / divisor } );
			TweenMax.to( foto2, 1, { rotationY:foto2.mouseX / divisor , rotationX:foto2.mouseY / divisor } );
			TweenMax.to( foto3, 1, { rotationY:foto3.mouseX / divisor , rotationX:foto3.mouseY / divisor } );
			TweenMax.to( foto4, 1, { rotationY:foto4.mouseX / divisor , rotationX:foto4.mouseY / divisor } );
			TweenMax.to( foto5, 1, { rotationY:foto5.mouseX / divisor , rotationX:foto5.mouseY / divisor } );
			TweenMax.to( foto6, 1, { rotationY:foto6.mouseX / divisor , rotationX:foto6.mouseY / divisor } );
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
		
		private function imagemClicadaHandler(e:MouseEvent):void 
		{
			imagemAmpliada = new ImagemAmpliada();
			imagemAmpliada.addEventListener(GaleriaEvent.FECHA_IMAGEM_AMPLIADA, fechaImagemAmpliadaHandler);
			imagemAmpliada.urlFoto = e.currentTarget.url;
			imagemAmpliada.urlDownload = e.currentTarget.urlDownload;
			imagemAmpliada.alpha = 0;
				
			addChild(imagemAmpliada);
				
			TweenMax.to(imagemAmpliada, .5, { alpha:1, ease:Cubic.easeInOut } );
		}
		
		private function fechaImagemAmpliadaHandler(e:GaleriaEvent):void 
		{
			TweenMax.to(imagemAmpliada, .3, { alpha:0, ease:Cubic.easeInOut, onComplete:removeImagemAmpliada } );
		}
		
		private function removeImagemAmpliada():void 
		{
			removeChild(imagemAmpliada);
		}
		
		override public function transitionIn():void 
		{
			super.transitionIn();
			TweenMax.to(this, 1.3, { alpha:1, onComplete:transitionInComplete } );
		}
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 0.3, {alpha:0, onComplete:transitionOutComplete});
		}
	}
}
