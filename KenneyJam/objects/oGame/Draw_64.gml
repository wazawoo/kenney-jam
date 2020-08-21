/// @description Insert description here
// You can write your code in this editor


//display number of people alive
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(TILE_SIZE*10, TILE_SIZE*2, string(instance_number(oPerson)) + " people remain")