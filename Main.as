package
{
	import net.flashpunk.*;
	import net.flashpunk.debug.*;
	import net.flashpunk.utils.*;
	
	public class Main extends Engine
	{
		public function Main () 
		{
			super(140, 105, 60, true);
			FP.world = new Level();
			FP.screen.color = 0xdcc67c;
			FP.screen.scale = 4;
		}
		
		public override function init (): void
		{
			super.init();
		}
		
		public override function update (): void
		{
			if (Input.pressed(FP.console.toggleKey)) {
				// Doesn't matter if it's called when already enabled
				FP.console.enable();
			}
			
			super.update();
		}
	}
}

