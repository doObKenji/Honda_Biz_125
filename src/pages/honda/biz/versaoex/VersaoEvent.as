package pages.honda.biz.versaoex 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Edson Prata Ishii
	 */
	public class VersaoEvent extends Event 
	{
		public static const FECHA_IMAGEM_AMPLIADA			:String = "fecha_imagem_ampliada";
		
		public function VersaoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new VersaoEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("VersaoEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}