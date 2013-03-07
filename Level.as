package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	import flash.display.*;
	
	public class Level extends World
	{
		public static var ditches:BitmapData;
		
		public function Level ()
		{
			ditches = new BitmapData(FP.width, FP.height, true, 0x0);
			
			addGraphic(new Stamp(ditches));
			
			add(new Crate());
			add(new Player());
		}
		
		public override function update (): void
		{
			super.update();
		}
		
		public override function render (): void
		{
			super.render();
		}
	}
}

