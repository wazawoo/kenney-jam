/// @description Insert description here
// You can write your code in this editor

//this is while we still exist
if (instance_number(oPerson) > 1) {
	audio_play_sound(soDie, 1, false)
} else {
	audio_play_sound(soDieLast, 1, false)
}