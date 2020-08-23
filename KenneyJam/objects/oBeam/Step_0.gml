/// @description Insert description here
// You can write your code in this editor

if (global.stepCount % (FRAME_RATE/6) == 0) {
	x += TILE_SIZE
	
	if (x >= RESOLUTION_H) {
		instance_destroy()
	}
}