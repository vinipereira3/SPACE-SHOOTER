if (end_region) exit;

//LIMITANDO O ESPAÇO DO PLAYER NA ROOM
if (y >= room_height-sprite_height/2 or y <= sprite_height/2)
{
	y = yprevious;
}

//LIMITANDO ESPAÇO HORIZONTAL
x = clamp(x, sprite_width/2, 240-sprite_width/2);