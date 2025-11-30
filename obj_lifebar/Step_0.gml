if (!instance_exists(obj_player)) exit;

var _current_hp = obj_player.hp_player;

if (_current_hp < 0) _current_hp = 0;

if (_current_hp != 1)
{
	sprite_index = spr_lifebar;
	image_index = _current_hp;
}else
{
	sprite_index = spr_low_life;
}