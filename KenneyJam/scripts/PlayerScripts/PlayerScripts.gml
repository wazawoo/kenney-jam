// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerMovement(keyUp, keyLeft, keyRight, keyDown) {
	var dx = oPlayer.hSpeed * (keyRight - keyLeft) * getMagnitude();
	var dy = oPlayer.vSpeed * (keyDown - keyUp) * getMagnitude();
	
	oPlayer.x += dx
	oPlayer.y += dy	
}

function getMagnitude() {
	var magnitude = (keyUp + keyDown + keyRight + keyLeft);
	
	if (magnitude > 1) {
		magnitude = 0;
	}
	
	return magnitude;
}