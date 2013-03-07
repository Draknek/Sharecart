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
		
		public var src:Tilemap;
		
		public var sandMask:Grid;
		
		public function Level (src:Tilemap = null, id:int = 0)
		{
			ditches = new BitmapData(FP.width, FP.height, true, 0x0);
			
			sandMask = new Grid(FP.width, FP.height, G.TW, G.TW);
			addMask(sandMask, "sand");
			
			var px:int = 0;
			var py:int = 0;
			
			if (src) {
				var ix:int;
				var iy:int;
				
				for (ix = 0; ix < src.columns; ix++) {
					for (iy = 0; iy < src.rows; iy++) {
						var tileID:int = src.getTile(ix, iy);
						
						var x:int = ix*G.TW;
						var y:int = iy*G.TW;
						
						if (tileID != 0) {
							FP.rect.x = x;
							FP.rect.y = y;
							FP.rect.width = FP.rect.height = G.TW;
							ditches.fillRect(FP.rect, G.DITCH_COLOR);
						}
						
						switch (tileID) {
							case 0:
								sandMask.setTile(ix, iy, true);
							break;
							case 2:
								px = x;
								py = y;
							break;
							case 3:
								add(new Crate(x, y));
							break;
						}
					}
				}
			}
			
			addGraphic(new Stamp(ditches));
			
			add(new Player(px, py));
		}
		
		public override function update (): void
		{
			super.update();
			
			if (Input.pressed(Key.E)) {
				FP.world = new Editor;
			}
		}
		
		public override function render (): void
		{
			super.render();
		}
	}
}

