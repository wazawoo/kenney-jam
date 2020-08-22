// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function playerMovement(keyUp, keyLeft, keyRight, keyDown) {
	with (oPlayer) {
	    
		
		
		hSpeed = keyRight - keyLeft;
	    vSpeed = keyDown - keyUp;
	    var dx = hSpeed * TILE_SIZE;
	    var dy = vSpeed * TILE_SIZE;
	    var dir = point_direction(0,0,hSpeed,vSpeed);
	
	    if (hSpeed != 0 || vSpeed != 0) {
			state = states.walking
			changeSprite(dir)
	    }
  
		var newX = x + dx
		var newY = y + dy
	
		if (newX >= 0 && newX < room_width && newY >= 0 && newY < room_height) {	
			//if the new tile is in bounds, check the tile
		
			var tileData = tilemap_get_at_pixel(global.tileMap, newX, newY)
			var tileIndex = tileData & tile_index_mask
		
			if (ds_list_find_index(global.playerCollisionTiles, tileIndex) != -1) {
				//we have collided with a collidable tile
				//show_debug_message()
			} else if (position_meeting(newX, newY, oPerson)) {
				//we have collided with a collidable object
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
		//if space pressed, create a curse (in the direction the player is facing)
		//curse dies after its animation is done
		//if anything collides with it, it will become cursed
		
		if (keySpace) {
			var dx = 0
			var dy = 0
			
			switch(lastDir) {
				case 0:
					//right
					dx = 1
					break;
				case 90:
					//up
					dy = -1
					break;
				case 180:
					//left
					dx = -1
					break;
				case 270:
					//down
					dy = 1
					break;
			}	
		
			var newCurse = instance_create_layer(x + dx*TILE_SIZE, y + dy*TILE_SIZE, "Effects", oCurse)
			
			//pass on the correct speed based on the direction we are facing
			newCurse.hSpeed = dx
			newCurse.vSpeed = dy
		}	
	}	
}

function changeSprite(dir) {
	with (oPlayer) {
		//show_debug_message(dir)
		switch(floor(dir)) {
			case 0: sprite_index = ghost_r; break;
			case 90: sprite_index = ghost_u; break;
			case 180.00: sprite_index = ghost_l; break;
			case 270: sprite_index = sPlayer; break;
		}
		lastDir = floor(dir)
	}
}
