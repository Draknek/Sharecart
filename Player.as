package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.*;
	import net.flashpunk.utils.*;
	
	public class Player extends Entity
	{
		[Embed(source="images/player.png")]
		public static const Gfx: Class;
		
		public var canMove:Boolean = true;
		
		public function Player (_x:Number = 0, _y:Number = 0)
		{
			x = _x;
			y = _y;
			
			width = height = G.TW;
			
			var image:Image = new Image(Gfx);
			image.y = height - image.height - 2;
			
			graphic = image;
		}
		
		public override function update (): void
		{
			doMove();
			layer = -y;
		}
		
		public function doMove ():void
		{
			if (! canMove) return;
			
			var dx:int = int(Input.pressed(Key.RIGHT)) - int(Input.pressed(Key.LEFT));
			var dy:int = int(Input.pressed(Key.DOWN)) - int(Input.pressed(Key.UP));
			
			if (dx) dy = 0;
			
			if (! dx && ! dy) return;
			
			var tweenTime:int = 7;
			
			var moveX:int = dx*G.TW;
			var moveY:int = dy*G.TW;
			
			var toX:int = x+moveX;
			var toY:int = y+moveY;
			
			if (toX < 0 || toY < 0 || toX >= FP.width || toY >= FP.height) {
				return;
			}
			
			if (collideTypes(["sand", "solid", "oasis"], toX, toY)) {
				return;
			}
			
			var crate:Crate = collide("crate", toX, toY) as Crate;
			
			if (crate) {
				crate.toX = crate.x + moveX;
				crate.toY = crate.y + moveY;
				
				if (crate.toX < 0 || crate.toY < 0 || crate.toX >= FP.width || crate.toY >= FP.height) {
					return;
				}
				
				if (crate.collideTypes(["crate", "solid", "oasis"], crate.toX, crate.toY)) {
					return;
				}
			}
			
			FP.tween(this, {x: toX, y: toY}, tweenTime, doneMoving);
			
			canMove = false;
			
			if (crate) {
				FP.tween(crate, {x: crate.x + moveX, y: crate.y + moveY}, tweenTime, crate.doneMoving);
			}
		}
		
		public function doneMoving ():void
		{
			canMove = true;
		}
	}
}

