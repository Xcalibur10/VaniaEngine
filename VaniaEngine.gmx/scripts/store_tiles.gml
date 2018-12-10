/*================================================================
Stores different kind of tiles.
These are just types, not the actual tiles.
They are stored for collision detection.
===============================================================*/


var w = floor(room_width/16)
var h = floor(room_height/16)

var map = ""

global.grid = ds_grid_create(w,h);
//ds_grid_clear(global.grid,tm_air);

for(yy=0;yy<h;yy++)

{
    for(xx=0;xx<w;xx++)
    {
    var tile = tile_layer_find(100, xx*16, yy*16)
    if(tile=-1) //check if grid position is empty (no tile)
        {
            global.grid[# xx, yy]=tm_air;
        }
        else
        {
            //This part will need to be more complex for
            //finding slopes and other special tiles
            global.grid[# xx, yy]=tm_solid;
            ww = tile_get_left(tile)/16;
            hh = tile_get_top(tile)/16;
            
            get_tile_from_background(ts_vania,xx,yy,tile,tm_stair_r,0,2,ww,hh);
            get_tile_from_background(ts_vania,xx,yy,tile,tm_stair_l,1,2,ww,hh);              
            get_tile_from_background(ts_vania,xx,yy,tile,tm_stair_end_bottom,30,31,ww,hh);
            get_tile_from_background(ts_vania,xx,yy,tile,tm_stair_end_top,31,31,ww,hh);
            
            //STAIRCASES
            for(var st=0;st<7;st++)
            {
                get_tile_from_background(ts_staircases,xx,yy,tile,tm_stair_end_bottom,0,st,ww,hh);
                get_tile_from_background(ts_staircases,xx,yy,tile,tm_stair_end_bottom,1,st,ww,hh);
                get_tile_from_background(ts_staircases,xx,yy,tile,tm_stair_end_bottom,2,st,ww,hh);
                get_tile_from_background(ts_staircases,xx,yy,tile,tm_stair_end_top,3,st,ww,hh);
                get_tile_from_background(ts_staircases,xx,yy,tile,tm_stair_end_top,4,st,ww,hh);
                get_tile_from_background(ts_staircases,xx,yy,tile,tm_stair_r,5,st,ww,hh);
                get_tile_from_background(ts_staircases,xx,yy,tile,tm_stair_l,6,st,ww,hh);              
            }
            //tile_remove_at(ts_vania,xx,yy,tile,tm_stair_end_bottom,30,31,ww,hh);
            //tile_remove_at(ts_vania,xx,yy,tile,tm_stair_end_top,31,31,ww,hh);
            
            //get_tile_from_background(ts_outdoor_nature,xx,yy,tile,"v",3,0);
            //get_tile_from_background(ts_outdoor_nature,xx,yy,tile,"b",4,0);

        }
    //map += string(global.grid[# xx, yy]); 
    }
    
    //show_debug_message(map)   //This will show the whole map in the compile window.
                                //Was good in early testing
    //map = ""
}

