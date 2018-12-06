///tile_optimization(layer)

var layer = argument0;
var vx=floor(view_xview[0]/tile_size);
var vy=floor(view_yview[0]/tile_size);
var vw=vx+floor(view_wview[0]/tile_size);
var vh=vy+floor(view_hview[0]/tile_size);

show_debug_message(vw);

for(var xx=vx;xx<vw;xx++)
{
  if(global.cycle < vh) 
    {
      tile_add(ts_test,0,0,16,16,xx*16,(vy+global.cycle)*16,100);
      show_debug_message("QUIT LOOP");

    }
global.cycle += 1;
}


//done_generating = true;
global.cycle = 0;
show_debug_message("GENERATION: DONE");
