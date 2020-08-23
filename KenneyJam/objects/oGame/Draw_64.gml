/// @description Insert description here
// You can write your code in this editor

// display number of curses you have left

draw_set_color(c_white)

var cursesRemaining = 0
var cursesRemainingText = ""
with (oPlayer) {
	cursesRemaining = cursesLeft
	cursesRemainingText = "=" + string(cursesRemaining)
}

draw_set_halign(fa_left)
var curse_text_x = TILE_SIZE
var curse_text_y = TILE_SIZE*1.5
if (room != roomEnd) {
	draw_text(curse_text_x, curse_text_y, cursesRemainingText)
}

//display number of people alive
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

var text_x = RESOLUTION_W / 2
var text_y = TILE_SIZE*2
var advance_text_y = RESOLUTION_H - TILE_SIZE*1

var numPeople = instance_number(oPerson)
var text = " villagers remain"
if (numPeople == 1) {
	text = " villager remains"
}

if (room != roomEnd) {
	draw_text(text_x, text_y, string(numPeople) + text)
}


// Check if any villagers are moving
var villagersAreMoving = false;
with (oPerson) {
	if (moving) {
		villagersAreMoving = true;
	}
}

if (numPeople == 0 || oGame.keyN) {
	global.readyToAdvance = true
	draw_text(text_x, advance_text_y, "smack any key u want")
	
	if (global.advanceNow || oGame.keyN) {
		global.readyToAdvance = false
		global.advanceNow = false
		
		//temp: loop back to first room for rapid testing
		if (room == room_last) {
			room_goto(roomIntro)
		} else {
			room_goto_next()
		}
		
		audio_play_sound(soNewRoom, 1, false)
	}
} 
//else if (cursesRemaining == 0 && !villagersAreMoving) {
//		global.readyToAdvance = true
//		draw_text(text_x, advance_text_y, "GAME OVER")
//		if (global.advanceNow) {
//			global.readyToAdvance = false
//			global.advanceNow = false
//			room_goto(roomIntro)
//		}
//}



if (room == roomEnd) {
	//draw end text
	
	//congrats!
	draw_text(RESOLUTION_W/2, TILE_SIZE*2, "CONGRATS!")
	
	//you completed
	draw_text(RESOLUTION_W/2, TILE_SIZE*4, "You completed GHOSTY")
	
	//GHOSTY
	
	//in N seconds
	draw_text(RESOLUTION_W/2, TILE_SIZE*6, "in " + string(global.gameTime) + " seconds")
	
	//with X curses
	draw_text(RESOLUTION_W/2, TILE_SIZE*8, "using " + string(global.cursesUsed) + " curses")
	
} else {
	//draw game timer
	draw_set_halign(fa_left)
	draw_set_color(c_yellow)
	draw_text(RESOLUTION_W - 2*TILE_SIZE, TILE_SIZE*1.5, global.gameTime)
}


