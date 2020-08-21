/// @description Insert description here
// You can write your code in this editor

global.tileMap = layer_tilemap_get_id(layer_get_id("Tiles_1"));


//tiles
//these numbers correspond to the index of the tile, which is the frame number - 1
global.playerCollisionTiles = ds_list_create()
ds_list_add(global.playerCollisionTiles, 48)  //tree
ds_list_add(global.playerCollisionTiles, 248) //water - middle
ds_list_add(global.playerCollisionTiles, 249) //water - edge
ds_list_add(global.playerCollisionTiles, 250) //water - corner
ds_list_add(global.playerCollisionTiles, 556) //fire
