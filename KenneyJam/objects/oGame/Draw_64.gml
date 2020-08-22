/// @description Insert description here
// You can write your code in this editor


//display number of people alive
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

var text_x = RESOLUTION_W / 2
var text_y = TILE_SIZE*2
var advance_text_y = RESOLUTION_H - TILE_SIZE*1

var numPeople = instance_number(oPerson)
var text = " people remain"
if (numPeople == 1) {
	text = " person remains"
}

draw_text(text_x, text_y, string(numPeople) + text)

if (numPeople == 0) {
	global.readyToAdvance = true
	draw_text(text_x, advance_text_y, "smack any key u want")
	
	if (global.advanceNow && room != room_last) {
		global.readyToAdvance = false
		global.advanceNow = false
		
		room_goto_next()
	}
}