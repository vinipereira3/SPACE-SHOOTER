

//IDENTIFICANDO A DISTANCIA DO INIMIGO PARA O PLAYER
if(distance_to_object(obj_player) < 125)
{
	if (alarm_activated == false)
	{
		alarm[0] = 1;
		alarm_activated = true;
	}	
}

//IDENTIFICANDO SE A INSTANCIA DEVE ATIRAR AO SAIR DA ROOM
if (shooter_endroom == 1)
{
	if (x == 0)
	{
		alarm[0] = 1;
	}
}