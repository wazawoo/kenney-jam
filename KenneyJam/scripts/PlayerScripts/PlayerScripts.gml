// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerMovement(keyUp, keyLeft, keyRight, keyDown) {
	with (oPlayer) {
	    var hInput = keyRight - keyLeft;
	    var vInput = keyDown - keyUp;
	    var dx = hSpeed * TILE_SIZE * hInput;
	    var dy = vSpeed * TILE_SIZE * vInput;
	    var dir = point_direction(0,0,hInput,vInput);
    
	    if (hInput != 0 || vInput != 0) {
	      oPlayer.changeSprite(dir)
	    }
  
		var newX = x + dx
		var newY = y + dy
	
		if (newX >= 0 && newX < room_width && newY >= 0 && newY < room_height) {	
			//if the new tile is in bounds, check the tile
		
			var tileData = tilemap_get_at_pixel(global.tileMap, newX, newY)
			var tileIndex = tileData & tile_index_mask
	
			if (ds_list_find_index(global.playerCollisionTiles, tileIndex) != -1) {
				//we have collided	
				//show_debug_message()
			} else {
				//no collision
				//free to move
				x = newX
				y = newY
			}
		}
	}	
}

function playerAction(keySpace) {	
	with (oPlayer) {
		//if space pressed, create a curse
		//curse dies after its animation is done
		//if anything collides with it, it will become cursed
		
		if (keySpace) {
			instance_create_layer(x, y, "Effects", oCurse)
		}	
	}	
}

function changeSprite(dir) {
	with (oPlayer) {
		show_debug_message(dir)
		switch(floor(dir)) {
			case 0: sprite_index = ghost_r; break;
			case 90: sprite_index = ghost_u; break;
			case 180.00: sprite_index = ghost_l; break;
			case 270: sprite_index = sPlayer; break;
		}
	}
}
