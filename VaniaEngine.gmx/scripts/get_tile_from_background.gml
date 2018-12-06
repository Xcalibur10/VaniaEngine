///get_tile_from_background(background,xx,yy,tile,id_string,tile_x,tile_y,tile_posx,tile_poxy)

var bg_image = argument0
var xx=argument1
var yy=argument2
var tile = argument3
var tile_id = argument4

var tx = argument5
var ty = argument6

var tile = tile_layer_find(100, xx*16, yy*16)

var wt = argument7; //tile_posx
var ht = argument8; ////tile_posy;

//wt = tile_get_left(tile)/16;
//ht = tile_get_top(tile)/16;

if(wt=tx and ht==ty) then
{
    //show_debug_message("Left Slope Found")
    var back = tile_get_background(tile)
    if(back == bg_image) then
    {
        global.grid[# xx, yy]=tile_id
}
}
