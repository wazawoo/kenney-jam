/// @description Insert description here
// You can write your code in this editor
var dir = point_direction(0,0,hSpeed,vSpeed);
	

if (hSpeed != 0 || vSpeed != 0) {
	switch(floor(dir)) {
		case 0: sprite_index = sCar_r; break;
		case 90: sprite_index = sCar_u; break;
		case 180.00: sprite_index = sCar_l; break;
		case 270: sprite_index = sCar_d; break;	
	}
}