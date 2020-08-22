/// @description Insert description here
// You can write your code in this editor

//set the speed based on the speed stored in the curse

if (!other.collidedOnce) {
	other.collidedOnce = true
	
	hSpeed = other.hSpeed
	vSpeed = other.vSpeed

	//change colors (use the second frame)
	image_index = 1
}
