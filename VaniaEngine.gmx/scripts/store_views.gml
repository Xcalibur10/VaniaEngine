var w = room_width/cam_width;
var h = room_height/cam_height;
var top = true;
var border = 0;

//show_debug_message("Rooms: "+string(w)+" | "+string(h))

global.views = ds_grid_create(w,h);
with (obj_border)
{
    //x=round(x/(cam_width*0.5))*0.5;
    //y=round(y/(cam_height*0.5))*0.5;
}

for(var xx=0;xx<w;xx++)
{
    for(var yy=0;yy<h;yy++)
    {
    var px = xx*cam_width+cam_width*0.5;
    var py = yy*cam_height+cam_height*0.5;
    
    if(position_meeting(px+cam_width*0.5,py,obj_border))
       {
       border += 1; //RIGHT BORDER
       }
    if(position_meeting(px,py-cam_height*0.5,obj_border))
       {
       border += 2; //TOP BORDER
       }
    if(position_meeting(px-cam_width*0.5,py,obj_border))
       {
       border += 4; //LEFT BORDER
       }
    if(position_meeting(px,py+cam_height*0.5,obj_border))
       {
       border += 8; //BOTTOM BORDER
       }
    global.views[# xx,yy] = border;
    //show_debug_message(string(xx)+" | "+string(yy)+" => "+string(global.views[# xx,yy]))
    border = 0;
    }
}

ini_open("views.ini");
ini_write_string("views", "0", ds_grid_write(global.views));
ini_close();

with(obj_border)
{
    instance_destroy();
}
