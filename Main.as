package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.events.MouseEvent;
	import tv.snorkl.utils.bitmap.BitmapTile;
	import tv.snorkl.utils.bitmap.BitmapTileGrid;

	
	/**
	 * ...
	 * @author erivan
	 */
	
	[SWF(width="900", height="600", backgroundColor="#F1882F", frameRate="30")]
	public class Main extends MovieClip
	{
	
		
		public var grid:BitmapTileGrid;
		
		public function Main() 
		{
			//grid = new BitmapTileGrid(Imagem_mc, 5, 10);
			//addChild(grid);
			
			//Imagem_mc.visible = false;
			//TweenMax.allFrom(grid.tilesArray, 2, { alpha:0, rotation:-90 }, .1);
			//TweenLite.to(Imagem_mc2, 3, {physicsProps:{x:{velocity:50}, y:{velocity:-260, acceleration:300}}});
			
			evtBotoes(this.Play1);
			evtBotoes(this.Play2);
			evtBotoes(this.Play3);
			
		
		}
		
		private function evtBotoes(obj:Object):void 
		{
			
			obj.addEventListener(MouseEvent.CLICK, tileArray);
			
		}
		

		
		private function tileArray(e:MouseEvent):void 
		{
			
			trace(e.currentTarget.name);
			
			switch (e.type) 
			{
				case MouseEvent.CLICK:
					
					if (e.currentTarget.name == "Play1") 
					{
						
						grid = new BitmapTileGrid(Imagem_mc, 5, 10);
						addChild(grid);							
						Imagem_mc.visible = false;
						TweenMax.allFrom(grid.tilesArray, 2, { alpha:0, rotation:-90 }, .1);
						//TweenLite.to(Imagem_mc2, 3, {physicsProps:{x:{velocity:50}, y:{velocity:-260, acceleration:300}}});							
						stage.addEventListener(MouseEvent.CLICK, tileArray);
						
						
					}else if (e.currentTarget.name == "Play2") 
					{
												
						grid = new BitmapTileGrid(Imagem_mc, 10, 20);
			
						addChild(grid);
						
						Imagem_mc.visible = false;				
						var tilesMax:int = grid.tilesArray.length;
					
						// here we use a for loop to loop through the BitmapTileGrid's tilesArray array.
						// this is handy when each tile needs unique starting and end values for its tween
					
						for (var i:int = 0; i < tilesMax; i++){
						
						var tile:BitmapTile = grid.tilesArray[i] as BitmapTile;						
						tile.y = Math.random()*600						
						tile.alpha = 0;						
						//note the originX and originY are properties of the BitmapTile class.
						//they give you easy access to any tiles origin in the grid.						
						TweenLite.killTweensOf(tile, .5, {alpha:1, x:tile.originX, y:tile.originY, ease:Back.easeOut, delay:i*.01});					
						}						
						
					}					
					
				break;
				
			}
			

		}
	}

}