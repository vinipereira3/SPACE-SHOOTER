//DETECTAR MOVIMENTO ATRAVÉS DAS SETAS DO TECLADO


up = keyboard_check(vk_up);
down =  keyboard_check(vk_down);
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);

#region MOVIMENTAÇÃO DA NAVE

//VERIFICANDO AS TECLAS DIREITA E ESQUERDA E APLICANDO MOVIMENTO NA HORIZONTAL

if (left)
{
	hspeed = -mov_speed;
	image_index = 0;
}else if (right)
{
	hspeed = mov_speed;
	image_index = 0;
}else
{
		hspeed = 0;
		image_index = 0;
}

//VERIFICANDO AS TECLAS CIMA E BAIXO E APLICANDO MOVIMENTO NA VERTICAL
if (up)
{
	vspeed = -mov_speed;
	image_index = 2;
} else if (down) 
{
	vspeed = mov_speed;
	image_index = 1; 
}
else
{
	vspeed = 0;
	image_index = 0;
}

#endregion

#region //TIROS

//TIRO COMUM
if (keyboard_check_pressed(ord("Z")))
{
	//CRIANDO O EFEITO AO DISPARAR O TIRO
	instance_create_layer(x+sprite_width/2, y, "EFEITO", obj_flash);
	
	//CRIANDO O TIRO
	instance_create_layer(x+sprite_width/2, y, "EFEITO", obj_shoot);	
	
	//EXECUTAR O SOM DO TIRO
	audio_play_sound(snd_shot_base, 5, false);
	
	
}	

//TIRO EXPLOSIVO

if (keyboard_check(ord("Z")))
{
	shoot_explosive_timer++;
	
	if (shoot_explosive_timer == 30) alarm[0] = 1;
	
	if (shoot_explosive_timer >= shoot_explosive_duration)
	{
		//O TIRO EXPLOSIVO VAI TÁ PRONTO QUANDO APERTAR "Z"
		shoot_explosive_ready = true;	
	}
}else if (keyboard_check_released(ord("Z")))
{
	//SE NÃO ESTÁ SENDO PRESSIONADA, ENTÃO CRIE O TIRO EXPLOSIVO E/OU REINICIE O CONTADOR
	if (shoot_explosive_ready)
	{
		instance_create_layer(x+sprite_width/2, y, "EFEITO", obj_flash2);
		instance_create_layer(x+sprite_width/2, y, "EFEITO", obj_shoot2);
		audio_play_sound(snd_shot_special, 5, false);
		
		
		shoot_explosive_ready = false;
		shoot_explosive_timer = 0;
		
	}
	else
	{
		shoot_explosive_timer = 0;
	}
	
	alarm[1] = 1;
}


//FAZENDO O EFEITO DE PARTICULA SEGUIR A POSIÇÃO FRONTORAL DO PLAYER
if (particle_system_shoot != noone) part_system_position(particle_system_shoot, x+sprite_width/2, y);

show_debug_message(shoot_explosive_timer);
		
#endregion

#region FIM DA FASE

	if (place_meeting(x,y,obj_endregion) and end_region == false)
	{
		image_index = 0;
		
		end_region = true
		
		hspeed = 0;
		vspeed = 0;
		
		alarm[5] = 120;
	
	}
	
#region HP

	if (hp_player < previous_hp and vulnerable)
	{
		audio_play_sound(snd_hit_player, 7, false);
		
		shoot_explosive_timer = 0;
		alarm[1] = 1;
		
		vulnerable = false;
		alarm[2] = 1;
		alarm[3] = 60;
		previous_hp = hp_player;
		
	}
	
	if (hp_player <= 0)
	{
		Explosion_enemy();
		instance_destroy();
	}
	
	#endregion
	
//IDENTIFICAR O FINAL DA FASE
end_region = false
	
	show_debug_message(hp_player);