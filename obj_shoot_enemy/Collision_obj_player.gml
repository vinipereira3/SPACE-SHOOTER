if(other.vulnerable) other.hp_player -= 1;
instance_destroy();
instance_create_layer(x,y,"EFEITO", obj_screen_shake);