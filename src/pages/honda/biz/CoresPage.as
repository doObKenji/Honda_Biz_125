package pages.honda.biz
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	import flash.text.TextField;
	
	public class CoresPage extends AbstractPage
	{	
		public var btVerde:MovieClip;
		public var btVermelho:MovieClip;
		public var btPreto:MovieClip;
		public var btRosa:MovieClip;
		
		public var cores:MovieClip;
		public var motos:MovieClip;
		
		private var nomeBotao:String;
		private var stringCor:String;
		
		
		public function CoresPage()
		{
			super();
			//alpha = 0;
			
			
			btVerde.buttonMode = btVermelho.buttonMode = btPreto.buttonMode = btRosa.buttonMode = true;
			btVerde.mouseChildren = btVermelho.mouseChildren = btPreto.mouseChildren = btRosa.mouseChildren = false;
			//Click botões
			btVerde.addEventListener(MouseEvent.CLICK, corSelecionada);
			btVermelho.addEventListener(MouseEvent.CLICK, corSelecionada);
			btPreto.addEventListener(MouseEvent.CLICK, corSelecionada);
			btRosa.addEventListener(MouseEvent.CLICK, corSelecionada);
			
			//Over botões
			btVerde.addEventListener(MouseEvent.MOUSE_OVER, overCoresHandler);
			btVermelho.addEventListener(MouseEvent.MOUSE_OVER, overCoresHandler);
			btPreto.addEventListener(MouseEvent.MOUSE_OVER, overCoresHandler);
			btRosa.addEventListener(MouseEvent.MOUSE_OVER, overCoresHandler);
			
			//Out botões
			btVerde.addEventListener(MouseEvent.MOUSE_OUT, outCoresHandler);
			btVermelho.addEventListener(MouseEvent.MOUSE_OUT, outCoresHandler);
			btPreto.addEventListener(MouseEvent.MOUSE_OUT, outCoresHandler);
			btRosa.addEventListener(MouseEvent.MOUSE_OUT, outCoresHandler);
			
			nomeBotao = "btVermelho";
		}
		
		private function outCoresHandler(e:MouseEvent):void 
		{
			//TweenMax.to(e.currentTarget, .5, { width:26, height: 41 } );
		}
		
		private function overCoresHandler(e:MouseEvent):void 
		{
			//TweenMax.to(e.currentTarget, .5, { width:13, height: 20 } );
		}
		
		private function corSelecionada(e:MouseEvent):void 
		{
			if ( e.currentTarget.name == nomeBotao)
			{
				
			}else
			{
				switch (e.currentTarget.name) 
				{
					case "btVermelho":
						cores.gotoAndStop(1);
						cores.gotoAndPlay(1);
						//TweenMax.to(cores, 0, { frame:1 } );
						//TweenMax.to(cores, 4, { frame:133 } );
					break;
					
					case "btRosa":
						//TweenMax.to(cores, 0, { frame:134 } );
						//TweenMax.to(cores, 4, { frame:267 } );
						cores.gotoAndStop(134);
						cores.gotoAndPlay(134);
					break;
					
					case "btVerde":
						//TweenMax.to(cores, 0, { frame:267 } );
						//TweenMax.to(cores, 4, { frame:401 } );
						cores.gotoAndStop(267);
						cores.gotoAndPlay(267);
					break;
					
					case "btPreto":
						//TweenMax.to(cores, 0, { frame:402 } );
						//TweenMax.to(cores, 4, { frame:535 } );
						cores.gotoAndStop(402);
						cores.gotoAndPlay(402);
					break;
				}
			}
			nomeBotao = e.currentTarget.name;
		}
		
		public function trocaCorHandler(cor:String):void
		{
			switch (cor) 
				{
					case "vermelho":
						motos.gotoAndPlay(2);
					break;
					
					case "rosa":
						motos.gotoAndPlay(14);
					break;
					
					case "verde":
						motos.gotoAndPlay(26);
					break;
					
					case "preto":
						motos.gotoAndPlay(38);
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
			TweenMax.to(this, 0.5, {alpha:0, onComplete:transitionOutComplete});
		}
	}
}
