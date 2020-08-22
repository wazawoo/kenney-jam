/// @description Insert description here
// You can write your code in this editor

// display number of curses you have left

var cursesRemaining = oPlayer.cursesLeft;
var cursesRemainingText = "=" + string(cursesRemaining);
var curse_text_x = TILE_SIZE*1.7
var curse_text_y = TILE_SIZE*1.5
draw_text(curse_text_x, curse_text_y, cursesRemainingText)


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
	
	if (global.advanceNow) {
		global.readyToAdvance = false
		global.advanceNow = false
		
		//temp: loop back to first room for rapid testing
		if (room == room_last) {
			room_goto(roomIntro)
		} else {
			room_goto_next()
		}
	}
} else if (cursesRemaining == 0) {
		global.readyToAdvance = true
		draw_text(text_x, advance_text_y, "GAME OVER")
		if (global.advanceNow) {
			global.readyToAdvance = false
			global.advanceNow = false
			room_goto(roomIntro)
		}
}