package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	import flash.display.*;
	
	public class Crate extends Entity
	{
		[Embed(source="images/crate.png")]
		public static const Gfx: Class;
		
		public var vx: Number = 0;
		public var vy: Number = 0;
		
		public function Crate (_x:Number = 0, _y:Number = 0)
		{
			x = _x;
			y = _y;
			
			x = 28;
			y = 28;
			
			width = height = G.TW;
			
			var image:Image = new Image(Gfx);
			image.y = height - image.height;
			
			graphic = image;
			
			type = "crate";
		}
		
		public override function added ():void
		{
			doneMoving();
		}
		
		public override function update (): void
		{
			layer = -y;
		}
		
		public function doneMoving ():void
		{
			var b:BitmapData = Level.ditches;
			
			FP.rect.x = x;
			FP.rect.y = y;
			FP.rect.width = width;
			FP.rect.height = height;
			
			b.fillRect(FP.rect, G.DITCH_COLOR);
		}
	}
}

