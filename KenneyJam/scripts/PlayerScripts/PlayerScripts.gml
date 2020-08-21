// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerMovement(keyUp, keyLeft, keyRight, keyDown) {
	var hInput = keyRight - keyLeft;
	var vInput = keyDown - keyUp;
	var dx = oPlayer.hSpeed * TILE_SIZE * hInput;
	var dy = oPlayer.vSpeed * TILE_SIZE * vInput;
	var dir = point_direction(0,0,hInput,vInput);
	
	var newX = oPlayer.x + dx
	var newY = oPlayer.y + dy
	
	var tileData = tilemap_get_at_pixel(global.tileMap, newX, newY)
	var tileIndex = tileData & tile_index_mask
	
	if (hInput != 0 || vInput != 0) {
		oPlayer.changeSprite(dir)
	}
	
	//show_debug_message(tileIndex)
	
	if (ds_list_find_index(global.playerCollisionTiles, tileIndex) != -1) {
		//we have collided	
		//show_debug_message()
	} else {
		//no collision
		//free to move
		oPlayer.x = newX
		oPlayer.y = newY
	}		
}

