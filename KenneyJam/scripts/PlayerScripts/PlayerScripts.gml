// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerMovement(keyUp, keyLeft, keyRight, keyDown) {
	var dx = oPlayer.hSpeed * (keyRight - keyLeft)
	var dy = oPlayer.vSpeed * (keyDown - keyUp)
	
	var newX = oPlayer.x + dx
	var newY = oPlayer.y + dy
	
	
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