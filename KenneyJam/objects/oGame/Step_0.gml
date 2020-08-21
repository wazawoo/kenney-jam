/// @description Insert description here
// You can write your code in this editor

keyLeft  = keyboard_check_pressed(vk_left)  || keyboard_check_pressed(ord("A"));
keyRight = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")); 
keyUp    = keyboard_check_pressed(vk_up)    || keyboard_check_pressed(ord("W")); 
keyDown  = keyboard_check_pressed(vk_down)  || keyboard_check_pressed(ord("S"));

playerMovement(keyUp, keyLeft, keyRight, keyDown);


if (global.stepCount % FRAME_RATE == 0) {
	//one second timer
	
	peopleMovement()
	
}

global.stepCount++