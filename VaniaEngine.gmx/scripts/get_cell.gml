///get_cell(x,y,offset_x,offset_y)

//Returns tile at position from ds_grid
//-1 is needed to keep it between 0-15 instead of 1-16 (NOPE)


var grid_x = floor((argument0)/16);
var grid_y = floor((argument1)/16);
var offset_x = argument2;
var offset_y = argument3;
//var def = argument4;

var gx = grid_x+offset_x;
var gy = grid_y+offset_y;

if(gx<0 or gx>floor(room_width/16)-1 or gy<0 or gy>floor(room_height/16)-1) then
{
    return -1;
}
else
{
    return global.grid[# gx, gy];
}
