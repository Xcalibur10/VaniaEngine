///tile_add_grid(x,y,tileset,tile_x,tile_y,depth,tile_id)

var xx=argument0;
var yy=argument1;
var tileset = argument2;
var tile_x = argument3;
var tile_y = argument4;
var tile_depth = argument5;
var tile_id = argument6;

//show_debug_message("TILESET: "+string(tileset));

tile_add(tileset,tile_x*16,tile_y*16,16,16,xx,yy,tile_depth);
global.grid[# xx/16, yy/16]=tile_id;
