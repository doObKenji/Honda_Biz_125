package pages.honda.biz
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	
	public class HomePage extends AbstractPage
	{	
		public var indexPage:IPageAsset;
		
		public function HomePage()
		{
			super();
			//alpha = 0;
			addEventListener(Event.ADDED_TO_STAGE, inicializa);
		}
		
		private function inicializa(e:Event):void 
		{
			
		}
		override public function transitionIn():void 
		{
			super.transitionIn();
			TweenMax.to(this, 1.3, { alpha:1, onComplete:transitionInComplete } );
		}
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 0.3, { alpha:0, onComplete:transitionOutComplete } );
		}
	}
}
