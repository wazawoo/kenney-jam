// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerMovement(keyUp, keyLeft, keyRight, keyDown) {
	var dx = oPlayer.hSpeed * TILE_SIZE * (keyRight - keyLeft)
	var dy = oPlayer.vSpeed * TILE_SIZE * (keyDown - keyUp)
	
	var newX = oPlayer.x + dx
	var newY = oPlayer.y + dy
	
	if (newX >= 0 && newX < room_width && newY >= 0 && newY < room_height) {	
		//if the new tile is in bounds, check the tile
		
		var tileData = tilemap_get_at_pixel(global.tileMap, newX, newY)
		var tileIndex = tileData & tile_index_mask
	
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
}