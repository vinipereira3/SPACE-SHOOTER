if (!instance_exists(obj_player)) exit;

//DETECTANDO A DIREÇÃO DO PLAYER

var _direction = point_direction(x,y, obj_player.x, obj_player.y);

//CRIANDO O OBJETO TIRO

var _bullet = instance_create_layer(x,y,"EFEITO", obj_shoot_enemy);

if (x <= x)
{
	_bullet.speed = 1.75;
}else
{
	_bullet.speed = 1.75;
}

_bullet.direction = _direction;

shoot_count++;

if (shoot_count < 3 and x > 0) 
{
	alarm[0] = 30;
}