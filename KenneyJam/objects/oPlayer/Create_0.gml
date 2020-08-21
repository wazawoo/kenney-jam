/// @description Insert description here
// You can write your code in this editor

//this is in tiles
hSpeed = 1
vSpeed = 1

function changeSprite(dir) {
	show_debug_message(dir)
	switch(floor(dir)) {
		case 0: sprite_index = ghost_r; break;
		case 90: sprite_index = ghost_u; break;
		case 180.00: sprite_index = ghost_l; break;
		case 270: sprite_index = sPlayer; break;
	}


}