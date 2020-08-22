/// @description Insert description here
// You can write your code in this editor

//resize the surface so the gui is the same size as the game
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
game_set_speed(FRAME_RATE, gamespeed_fps);
draw_set_font(fontMain);

global.stepCount = 0
global.readyToAdvance = false
global.advanceNow = false

//tiles
//these numbers correspond to the index of the tile, which is the frame number - 1
global.playerCollisionTiles = ds_list_create()

//we are ghost
//no collide with tiles for now
//ds_list_add(global.playerCollisionTiles, 48)  //tree
//ds_list_add(global.playerCollisionTiles, 248) //water - middle
//ds_list_add(global.playerCollisionTiles, 249) //water - edge
//ds_list_add(global.playerCollisionTiles, 250) //water - corner
//ds_list_add(global.playerCollisionTiles, 556) //fire


var deathTiles = [200, 201, 202, 204, 249, 250, 251, 252, 252, 253, 556];
// 200 - Water
// 201 - Water
// 202 - Water
// 203 - Water
// 204 - Water
// 249 - Water
// 250 - Water
// 251 - Water
// 252 - Water
// 253 - Water
// 556 - Fire
//


global.personCollisionTiles = ds_list_create()
global.personDeathTiles = ds_list_create()


// I'm not used to having this much memory so I'm going to waste it all!!!!
// Adds all tiles as collision tiles unless in deathTiles array
// then add as death tile

for (var i = 1; i < 1009; i ++) {
	for (var itwo = 0; itwo < array_length_1d(deathTiles); itwo++) {	
		if (i == deathTiles[itwo]) {
			ds_list_add(global.personDeathTiles, i) //water
		} else {
			ds_list_add(global.personCollisionTiles, i) //cactus
		}
	}
}


//ds_list_add(global.personCollisionTiles, 54) //cactus





