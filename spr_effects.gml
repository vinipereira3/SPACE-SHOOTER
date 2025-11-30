// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Hit(){
	audio_play_sound(snd_hit_enemy, 7, false);
	instance_create_layer(x+sprite_width/2, y, "EFEITO", obj_hit);
}

function Explosion_enemy(){
	instance_create_layer(x,y, "EFEITO", obj_enemy_explosion);
}

function Explosion_area(){
	audio_play_sound(snd_explosion, 7, false);
	instance_destroy(other);
	Hit();
	instance_create_layer(x,y,"ENEMIES", obj_explosion_area);
	instance_destroy();
}