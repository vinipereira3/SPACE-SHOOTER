//CAPTURANDO X E Y ATUAIS DA CAMERA
cam_startX = camera_get_view_x(view_camera[0]);
cam_startY = camera_get_view_x(view_camera[0]);

global.shake_duration = 10; //DURAÇÃO EM FRAMES
global.shake_intensity = 2; //PESO PARA O TREMOR

alarm[0] = global.shake_duration;