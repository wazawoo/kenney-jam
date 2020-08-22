// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function peopleMovement(){
	with (oPerson) {
		//do this for each instance of oPerson
		
		if (image_index == 0) {
			//we are not cursed
			//follow movement pattern
			var len = string_length(movementPattern)
			
			if (len > 0) {
				var char = string_char_at(movementPattern, moveIndex)
				
				show_debug_message("char: " + char)
				
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
		}
		
		var newX = x + hSpeed * TILE_SIZE
		var newY = y + vSpeed * TILE_SIZE
		
		var tileData = tilemap_get_at_pixel(global.tileMap, newX, newY)
		var tileIndex = tileData & tile_index_mask
	
		//move
		if (ds_list_find_index(global.personCollisionTiles, tileIndex) != -1) {
			//we have collided	
			//show_debug_message()
		}  else if (position_meeting(newX, newY, oPerson)) {
			//we have collided with a collidable object
			//(collide with other people)
		} else {
			//no collision
			//free to move
			x = newX
			y = newY
		}
		
		//check if we need to die
		if (x < 0 || x >= room_width || y < 0 || y >= room_height) {
			//out of bounds
			//die
			instance_destroy()
		} else if (ds_list_find_index(global.personDeathTiles, tileIndex) != -1) {
			//we collided with a dangerous tile
			//die
			instance_destroy()
		}
	}	
}