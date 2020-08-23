/// @description Insert description here
// You can write your code in this editor

//every 2 seconds, shoot a round
if (global.stepCount % (2*FRAME_RATE) == 0) {
	//fire tank round
	//for now, tanks can only shoot right...
	instance_create_layer(x + TILE_SIZE, y, "Effects", oBeam)
	audio_play_sound(soLaser, 1, false)
}