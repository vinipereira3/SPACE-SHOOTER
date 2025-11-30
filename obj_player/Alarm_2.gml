//APLICA EFEITO DE INVULNERABILIDADE

//ALTERA A OPACIDADE
if(image_alpha == 1){
	image_alpha = 0;
}else{
	image_alpha = 1;
}

if (!vulnerable)
{
	alarm[2] = 2;
}else{
	image_alpha = 1;
}