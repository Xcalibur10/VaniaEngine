///snap_to_tile_x(x,offset)

var xx = argument0
var offset = argument1
var newx = floor(xx/16)*16;
newx+=offset;

show_debug_message("snapped to "+string(newx));

return newx;
