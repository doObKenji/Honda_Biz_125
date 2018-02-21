package pages.honda.biz
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import com.greensock.layout.LiquidStage;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	
	public class EspecificacoesPage extends AbstractPage
	{	
		public var bullet1:MovieClip;
		public var bullet2:MovieClip;
		public var bullet3:MovieClip;
		public var bullet4:MovieClip;
		public var bullet5:MovieClip;
		
		public var descricao:MovieClip;
		
		private var arrayBts:Array;
		private var arrayItens:Array;
		
		public var item1:MovieClip;
		public var item2:MovieClip;
		public var item3:MovieClip;
		public var item4:MovieClip;
		public var item5:MovieClip;
		
		public var barraTec:MovieClip;
		
		private var itemAtual:MovieClip;
		
		private var nomeItem:String;
		
		public function EspecificacoesPage()
		{
			super();
			alpha = 0;
			
			arrayBts = new Array(bullet1, bullet2, bullet3, bullet4, bullet5);
			arrayItens = new Array(item1, item2, item3, item4, item5);
			
			for (var i:int = 0; i < arrayBts.length; i++) 
			{
				arrayBts[i].buttonMode = true;
				arrayBts[i].mouseChildren = false;
				arrayBts[i].selecionado = false;
				arrayBts[i].id = i;
				arrayBts[i].addEventListener(MouseEvent.CLICK, abreDescricaoHandler);
				arrayBts[i].addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
				arrayBts[i].addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
				
				arrayItens[i].visible = false;
			}
			
			arrayBts[0].selecionado = true;
			TweenMax.to(arrayBts[0], .5, { frame:2 } );
			
			addEventListener(Event.ADDED_TO_STAGE, inicializa);
		}
		
		private function inicializa(e:Event):void 
		{
			LiquidStage.init( stage , 980 , 610 );
			LiquidStage.pinObject( barraTec , LiquidStage.BOTTOM_CENTER );
			barraTec.alpha = 1;
			barraTec.visible = true;
		}
		
		public function fimAnima():void
		{
			itemAtual = MovieClip(arrayItens[0]);
			itemAtual.visible = true;
			
			TweenMax.to(itemAtual, .5, { frame:20 } );
			
		}
		
		private function mouseOutHandler(e:MouseEvent):void 
		{
			if (e.currentTarget.selecionado == true)
			{
				
			}else
				TweenMax.to(e.currentTarget, .5, { frame:1 } );
		}
		
		private function mouseOverHandler(e:MouseEvent):void 
		{
			if (e.currentTarget.selecionado == true)
			{
				
			}else
				TweenMax.to(e.currentTarget, .5, { frame:2 } );
		}
		
		private function abreDescricaoHandler(e:MouseEvent):void 
		{
			for (var j:int = 0; j < arrayBts.length; j++) 
			{
				arrayBts[j].selecionado = false;
				TweenMax.to(arrayBts[j], .5, { frame:1 } );
			}
			TweenMax.to(itemAtual, .5, { frame:40, onComplete:trocaDescricao } );
			itemAtual = arrayItens[e.currentTarget.id];
			nomeItem = String(e.currentTarget.name);
		}
		
		private function trocaDescricao():void 
		{
			for (var i:int = 0; i < arrayItens.length; i++) 
			{
				TweenMax.to(arrayItens[i], 0, { frame:1 } );
			}
			switch (nomeItem) 
			{
				case "bullet1":
					itemAtual.visible = true;
					TweenMax.to(itemAtual, .5, { frame:20 } );
					arrayBts[0].selecionado = true;
					TweenMax.to(arrayBts[0], .5, { frame:2 } );
				break;
				
				case "bullet2":
					trace("bullet2")
					itemAtual.visible = true;
					TweenMax.to(itemAtual, .5, { frame:20 } );
					arrayBts[1].selecionado = true;
					TweenMax.to(arrayBts[1], .5, { frame:2 } );
				break;
				
				case "bullet3":
					itemAtual.visible = true;
					TweenMax.to(itemAtual, .5, { frame:20 } );
					arrayBts[2].selecionado = true;
					TweenMax.to(arrayBts[2], .5, { frame:2 } );
				break;
				
				case "bullet4":
					itemAtual.visible = true;
					TweenMax.to(itemAtual, .5, { frame:20 } );
					arrayBts[3].selecionado = true;
					TweenMax.to(arrayBts[3], .5, { frame:2 } );
				break;
				
				case "bullet5":
					itemAtual.visible = true;
					TweenMax.to(itemAtual, .5, { frame:20 } );
					arrayBts[4].selecionado = true;
					TweenMax.to(arrayBts[4], .5, { frame:2 } );
				break;
			}
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
