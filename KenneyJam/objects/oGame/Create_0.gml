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

global.personCollisionTiles = ds_list_create()
ds_list_add(global.personCollisionTiles, 54) //cactus

global.personDeathTiles = ds_list_create()
ds_list_add(global.personDeathTiles, 200) //water
ds_list_add(global.personDeathTiles, 201) //water
ds_list_add(global.personDeathTiles, 202) //water
ds_list_add(global.personDeathTiles, 203) //water
ds_list_add(global.personDeathTiles, 204) //water
ds_list_add(global.personDeathTiles, 249) //water
ds_list_add(global.personDeathTiles, 250) //water
ds_list_add(global.personDeathTiles, 251) //water
ds_list_add(global.personDeathTiles, 252) //water
ds_list_add(global.personDeathTiles, 253) //water
ds_list_add(global.personDeathTiles, 556) //fire