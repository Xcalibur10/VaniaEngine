var ox = argument0;
var oy = argument1;

var v_off = 32;

var vx = floor(ox-view_wview[0]/2);
var vy = floor(oy-view_hview[0]/2);

var rx=clamp(floor(ox/cam_width),0,room_width-1);
var ry=clamp(floor(oy/cam_height),0,room_height-1);

var br = false;
var bt = false;
var bl = false;
var bb = false;

var c = 8;

var scrtype=0;

var rxw = 0
var rxh = 0

var bg_x = rx;
var bg_y = ry;

if(vx<=0) vx = 0;
if(vx>=room_width-view_wview[0]) vx = room_width-view_wview[0];
view_xview[0] = round(vx);



if(vy<=-40) vy = -40;
if(vy>=room_height-8-view_hview[0]) vy = room_height-view_hview[0]-8;
view_yview[0] = round(vy);


//--------------------------
///BG Controller

//Fix BG (like sky)

background_x[0] = round(view_xview[0]);
background_y[0] = round(view_yview[0]+v_off);

background_x[1] = round(view_xview[0]*(0.9));
background_y[1] = round(view_yview[0]*(0.9)+v_off+20);

background_x[2] = round(view_xview[0]*0.7);
background_y[2] = round(view_yview[0]*0.7+v_off+70);

background_x[3] = round(view_xview[0]*0.5);
background_y[3] = round(view_yview[0]*0.5+v_off-10);

background_x[4] = round(view_xview[0]*0.35);
background_y[4] = round(view_yview[0]*0.35+v_off);

background_x[5] = round(view_xview[0]*0.15);
background_y[5] = round(view_yview[0]*0.15+v_off);
