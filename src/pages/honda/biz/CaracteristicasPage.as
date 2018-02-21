package pages.honda.biz
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import com.gustavofelizola.display.ButtonMovieClip;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class CaracteristicasPage extends AbstractPage
	{	
		public var bullet1:MovieClip;
		public var bullet2:MovieClip;
		public var bullet3:MovieClip;
		public var bullet4:MovieClip;
		public var bullet5:MovieClip;
		public var bullet6:MovieClip;
		public var bullet7:MovieClip;
		public var bullet8:MovieClip;
		public var bullet9:MovieClip;
		
		public var descricao:MovieClip;
		
		private var fechar:MovieClip;
		private var direita:MovieClip;
		private var esquerda:MovieClip;
		
		private var controle:int = 1;
		
		
		private var arrayBts:Array;
		private var arrayItens:Array;
		
		private var item1:MovieClip;
		private var item2:MovieClip;
		private var item3:MovieClip;
		private var item4:MovieClip;
		private var item5:MovieClip;
		private var item6:MovieClip;
		private var item7:MovieClip;
		private var item8:MovieClip;
		private var item9:MovieClip;
		
		private var itemAnima:MovieClip;
		
		public function CaracteristicasPage()
		{
			super();
			alpha = 0;
			
			descricao.alpha = 0;
			descricao.visible = false;
			
			item1 = descricao.item1;
			item2 = descricao.item2;
			item3 = descricao.item3;
			item4 = descricao.item4;
			item5 = descricao.item5;
			item6 = descricao.item6;
			item7 = descricao.item7;
			item8 = descricao.item8;
			item9 = descricao.item9;
			
			fechar = descricao.fechar;
			direita = descricao.direita;
			esquerda = descricao.esquerda;
			
			fechar.buttonMode = direita.buttonMode = esquerda.buttonMode = true;
			//fechar.addEventListener(MouseEvent.CLICK, fechaDescricaoHandler);
			//direita.addEventListener(MouseEvent.CLICK, animaSaidaImagem);
			//esquerda.addEventListener(MouseEvent.CLICK, animaSaidaImagem);
			
			ButtonMovieClip.addButtonEvents( fechar , ButtonMovieClip.FRONT, { time: fechar.totalFrames / 30 } , fechaDescricaoHandler );
			ButtonMovieClip.addButtonEvents( direita , ButtonMovieClip.FRONT, { time: direita.totalFrames / 30 } , animaSaidaImagem );
			ButtonMovieClip.addButtonEvents( esquerda , ButtonMovieClip.FRONT, { time: esquerda.totalFrames / 30 } , animaSaidaImagem );
			
			
			arrayBts = new Array(bullet1, bullet2, bullet3, bullet4, bullet5, bullet6, bullet7, bullet8, bullet9);
			arrayItens = new Array(item1, item2, item3, item4, item5, item6, item7, item8, item9);
			
			
			for (var i:int = 0; i < arrayBts.length; i++) 
			{
				arrayBts[i].buttonMode = true;
				arrayBts[i].mouseChildren = false;
				arrayBts[i].id = i + 1;
				//arrayBts[i].addEventListener(MouseEvent.CLICK, abreDescricaoHandler);
				ButtonMovieClip.addButtonEvents( arrayBts[i] , ButtonMovieClip.FRONT, { time: arrayBts[i].totalFrames / 30 } , abreDescricaoHandler );
				arrayItens[i].visible = false;
			}
		}
		
		private function trocaImagemDireita():void 
		{
			TweenMax.to(arrayItens[controle-1], 0, { frame:1 } );
			
			if (controle >= arrayBts.length)
			{
				controle = 1;
				desabilitaItens();
				arrayItens[controle-1].visible = true;
				TweenMax.to(arrayItens[controle-1], .5, { frame:15 } );
			}
			else {
				controle++;
				desabilitaItens();
				arrayItens[controle-1].visible = true;
				TweenMax.to(arrayItens[controle-1], .5, { frame:15 } );
			}
		}
		
		private function animaSaidaImagem(e:MouseEvent):void 
		{
			switch (e.currentTarget.name) 
			{
				case "esquerda":
					TweenMax.to(arrayItens[controle-1], .5, { frame:30, onComplete:trocaImagemEsquerda } );
				break;
				
				case "direita":
					TweenMax.to(arrayItens[controle-1], .5, { frame:30, onComplete:trocaImagemDireita } );
				break;
			}
			
		}
		
		private function trocaImagemEsquerda():void 
		{
			TweenMax.to(arrayItens[controle-1], 0, { frame:1 } );
			
			if (controle <= 1)
			{
				controle = 9;
				desabilitaItens();
				arrayItens[controle-1].visible = true;
				TweenMax.to(arrayItens[controle-1], .5, { frame:15 } );
			}
			else {
				controle--;
				desabilitaItens();
				arrayItens[controle-1].visible = true;
				TweenMax.to(arrayItens[controle-1], .5, { frame:15 } );
			}
		}
		
		private function desabilitaItens():void
		{
			for (var i:int = 0; i < arrayItens.length; i++) 
			{
				arrayItens[i].visible = false;
			}
		}
		
		private function fechaDescricaoHandler(e:MouseEvent):void 
		{
			TweenMax.to(descricao, .5, { alpha:0, onComplete: removeDescricao } );
		}
		
		private function removeDescricao():void 
		{
			descricao.visible = false;
		}
		
		private function abreDescricaoHandler(e:MouseEvent):void 
		{
			descricao.visible = true;
			descricao.gotoAndStop(e.currentTarget.id);
			controle = e.currentTarget.id;
			
			for (var i:int = 0; i < arrayItens.length; i++) 
			{
				arrayItens[i].visible = false;
			}
			
			arrayItens[controle-1].visible = true;
			TweenMax.to(arrayItens[controle-1], .5, { frame:15 } );
			TweenMax.to(descricao, .5, { alpha:1 } );
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
