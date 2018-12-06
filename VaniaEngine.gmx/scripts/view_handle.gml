var ox = argument0;
var oy = argument1;

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

/*
var border = global.views[# rx,ry];
//show_debug_message("BORDER= "+string(border))

//Get borders... would have been better in a loop...
if(border - c>=0) then {bb = true; border = border -c;};
c/=2;
if(border - c>=0) then {bl = true; border = border -c;};
c/=2;
if(border - c>=0) then {bt = true; border = border -c;};
c/=2;
if(border - c>=0) then {br = true; border = border -c;};
*/
var rxw = 0
var rxh = 0

var bg_x = rx;
var bg_y = ry;

if(br == true or bl == true)
{
    //show_debug_message("Horizontal Scrolling")
}
if(bt == true or bb == true)
{
    //show_debug_message("Vertical Scrolling")
}

if(br)
{
    if(vx>=rx*cam_width) vx = rx*cam_width;
}

if(bl)
{
    if(vx<=rx*cam_width) vx = rx*cam_width;
}

if(bt)
{
    if(vy<=ry*cam_height) vy = ry*cam_height;
}

if(bb)
{
    if(vy>=ry*cam_height) vy = ry*cam_height;
}


if(vx<=0) vx = 0;
if(vx>=room_width-view_wview[0]) vx = room_width-view_wview[0];
view_xview[0] = round(vx);



if(vy<=0) vy = 0;
if(vy>=room_height-view_hview[0]) vy = room_height-view_hview[0];
view_yview[0] = round(vy);


//--------------------------
///BG Controller

//Fix BG (like sky)

background_x[0] = round(view_xview[0]);
background_y[0] = round(view_yview[0]+40);

background_x[1] = round(view_xview[0]*(0.9));
background_y[1] = round(view_yview[0]*(0.9)+40);

background_x[2] = round(view_xview[0]*0.7);
background_y[2] = round(view_yview[0]*0.7+40);

background_x[3] = round(view_xview[0]*0.5);
background_y[3] = round(view_yview[0]*0.5+40);

background_x[4] = round(view_xview[0]*0.35);
background_y[4] = round(view_yview[0]*0.35+40);

background_x[5] = round(view_xview[0]*0.15);
background_y[5] = round(view_yview[0]*0.15+40);
