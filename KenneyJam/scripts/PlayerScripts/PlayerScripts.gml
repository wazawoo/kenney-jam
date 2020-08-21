// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerMovement(keyUp, keyLeft, keyRight, keyDown) {
	
	var magnitude = (keyUp + keyDown + keyRight + keyLeft);
	
	if (magnitude > 1) {
		magnitude = 0;
	}
	
	var dx = oPlayer.hSpeed * (keyRight - keyLeft) * magnitude;
	var dy = oPlayer.vSpeed * (keyDown - keyUp) * magnitude;
	
	oPlayer.x += dx
	oPlayer.y += dy	
}
