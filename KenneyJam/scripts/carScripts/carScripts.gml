// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function carMovement(){
	with (oCar) {
		//do this for each instance of oCar
		

			//follow movement pattern
			var len = string_length(movementPattern)
			
			if (len > 0) {
				var char = string_char_at(movementPattern, moveIndex)
				
				switch (char) {
					case "u":
						hSpeed = 0
						vSpeed = -1
						break;
					case "r":
						hSpeed = 1
						vSpeed = 0
						break;
					case "l":
						hSpeed = -1
						vSpeed = 0
						break;
					case "d":
						hSpeed = 0
						vSpeed = 1
						break;
				}
				
				//string is indexed by 1, not 0
				if (moveIndex < len) {
					moveIndex++
				} else {
					moveIndex = 1
				}
			}
		
		
		var newX = x + hSpeed * TILE_SIZE
		var newY = y + vSpeed * TILE_SIZE
		
		
		var tileData = tilemap_get_at_pixel(global.tileMap, newX, newY)
		var tileIndex = tileData & tile_index_mask
	
			
			x = newX
			y = newY

	}	
}