package pages.honda.biz
{
	import com.gaiaframework.assets.MovieClipAsset;
	import com.gaiaframework.core.SiteController;
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import com.greensock.layout.LiquidStage;
	import com.greensock.plugins.TintPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.TweenLite;
	import com.gustavofelizola.display.ButtonMovieClip;
	import fl.motion.Color;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	public class NavPage extends AbstractPage
	{	
		public var logoHonda:MovieClip;
		public var logoFlex:MovieClip;
		
		private var btHome				:MovieClip;
		private var btVersao			:MovieClip;
		private var btCaracteristicas	:MovieClip;
		private var btEspecificacoes	:MovieClip;
		private var btCores				:MovieClip;
		private var btGaleria			:MovieClip;
		private var btDownloads			:MovieClip;
		private var comoComprar			:MovieClip;
		
		private var asa					:MovieClip;
		//private var fundoLogo			:MovieClip;
		
		public var menu:MovieClip
		
		
		private var bts:/*MovieClip*/Array ;
		private var branchs:/*String*/Array ;
		
		public function NavPage()
		{
			super();
			
			btHome = menu.btHome;
			btVersao = menu.btVersao;
			btCaracteristicas = menu.btCaracteristicas;
			btEspecificacoes = menu.btEspecificacoes;
			btCores = menu.btCores;
			btGaleria = menu.btGaleria;
			btDownloads = menu.btDownloads;
			comoComprar = menu.comoComprar;
			
			TweenPlugin.activate([TintPlugin]);
			
			alpha = 0;
			//Array de Botoes e Nome das Areas
			bts = new Array( btHome, btVersao, btCaracteristicas, btEspecificacoes, btCores, btDownloads, btGaleria, comoComprar ) ;
			branchs = new Array( Pages.HOME, Pages.VERSAO_EX, Pages.CARACTERISTICAS, Pages.ESPECIFICACOES, Pages.CORES, Pages.DOWNLOADS, Pages.GALERIA, Pages.COMO_COMPRAR);
			
			for (var i:int = 0; i < bts.length; i++) 
			{
				//bts[i].buttonMode = true;
			}
			
			//fundoLogo = logoHonda.fundoLogo;
			//fundoLogo.mouseChildren = false;
			//fundoLogo.mouseEnabled = false;
			//Botão Logo
			asa = logoHonda.asa;
			asa.buttonMode = true;
			asa.addEventListener(MouseEvent.CLICK, logoClick);
			asa.addEventListener(MouseEvent.MOUSE_OVER, logoOver);
			asa.addEventListener(MouseEvent.MOUSE_OUT, logoOut);
			
			/*
			logoFlex.buttonMode = comoComprar.buttonMode = true;
			logoFlex.addEventListener(MouseEvent.CLICK, hondaFlexClickHandler);
			logoFlex.addEventListener(MouseEvent.MOUSE_OVER, logoOver);
			logoFlex.addEventListener(MouseEvent.MOUSE_OUT, logoOut);
			*/
			
			setChildIndex(menu, 0);
			addEventListener(Event.ADDED_TO_STAGE, inicializa);
		}
		
		private function logoOut(e:MouseEvent):void 
		{
			TweenMax.to(e.currentTarget, 1, {colorTransform:{tint:0x000000, tintAmount:0}});
		}
		
		private function logoOver(e:MouseEvent):void 
		{
			TweenMax.to(e.currentTarget, 1, {colorTransform:{tint:0x000000, tintAmount:.7}});
		}
		
		private function inicializa(e:Event):void 
		{
			
		}
		
		private function hondaFlexClickHandler(e:MouseEvent):void 
		{
			navigateToURL(new URLRequest("http://www4.honda.com.br/flex"), "_blank");
		}
		
		private function btMenuClick(e:MouseEvent = null):void
		{
			
			var branchTo:String = "" ;
			var i:int = 0;
			var t:int = bts.length ;
			for ( i = 0 ; i < t; i++ ) 
			{
				if ( bts[i] == e.currentTarget )
				{
					branchTo = branchs[i] ;
				}
			}
			
			Gaia.api.goto( branchTo );
			AddEvents( e.currentTarget as MovieClip );
			
		}
		
		private function VerificaAtual(e:GaiaEvent = null):void
		{
			var atual:String = Gaia.api.getCurrentBranch();
			var btAtual:MovieClip;
			
			//trace( atual );
			
			var i:int = 0;
			var t:int = branchs.length ;
			for ( i = 0 ; i < t; i++) 
			{
				if ( atual.indexOf( branchs[i] ) >= 0 ) btAtual = bts[i] ;
			}
			
			AddEvents( btAtual );
		}
		
		private function AddEvents( btAtual:MovieClip = null ):void 
		{
			var i:int = 0 ;
			var t:int = bts.length ;
			for ( i = 0 ; i < t; i++) 
			{
				if ( bts[i] != btAtual ) {
						bts[i].mouseEnabled = true;
						bts[i].mouseChildren = true;
						ButtonMovieClip.addButtonEvents( bts[i] , ButtonMovieClip.FRONT, { time: bts[i].totalFrames / 30 } , btMenuClick );
						//bts[i].addEventListener(MouseEvent.CLICK, btMenuClick);
				} else {
					//ButtonMovieClip.removeButtonEvents( bts[i] );
					bts[i].removeEventListener(MouseEvent.CLICK, btMenuClick);
					bts[i].mouseEnabled = false;
					bts[i].mouseChildren = false;
					TweenMax.to( btAtual , .5 , { frame:btAtual.totalFrames } );
				}
			}
		}
		
		
		private function logoClick(e:MouseEvent = null):void
		{
			navigateToURL( new URLRequest("http://www.honda.com.br") ) ;
		}
		
		override public function transitionIn():void 
		{
			super.transitionIn();
			TweenMax.to(this, 0.3, { alpha:1, onComplete:transitionInComplete } );
			
			Gaia.api.afterPreload( VerificaAtual );
			VerificaAtual();
			
			IMovieClip( assets.barra2011 ).visible = true ;
			IMovieClip( assets.barra2011 ).alpha = 1 ;
			IMovieClip( assets.barra2011 ).content.atualSiteTitle = "Honda Biz125" ;
			IMovieClip( assets.barra2011 ).content.atualSiteDescription = "Bem vindo a linha 2011 - Biz125" ;
			IMovieClip( assets.barra2011 ).content.atualSiteAddress = "http://www.honda.com.br/biz125" ;
			
			addChildAt( IMovieClip( assets.barra2011 ).content , 1 );
			
			LiquidStage.init( stage , 980 , 610 );
			LiquidStage.pinObject( logoHonda , LiquidStage.BOTTOM_RIGHT );
			LiquidStage.pinObject( logoFlex , LiquidStage.BOTTOM_LEFT );
			LiquidStage.pinObject( menu , LiquidStage.TOP_CENTER );
			
			//for (var j:int = 0; j < bts.length; j++) 
			//{
				//LiquidStage.pinObject( bts[j] , LiquidStage.TOP_LEFT );
			//}
			TweenMax.to(menu, 1.5, { frame:41 } );
		}
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 0.3, {alpha:0, onComplete:transitionOutComplete});
		}
	}
}
