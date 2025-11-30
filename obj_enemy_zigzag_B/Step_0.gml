timer +=0.01; // aumentando o tempo

if (timer >= 1) timer = 0;

var _pos_atual = animcurve_channel_evaluate(canal, timer);

//APLICANDO O VALOR RESULTANTE AO MOVIMENTO VERTICAL
y = ystart + _pos_atual * amplitude;