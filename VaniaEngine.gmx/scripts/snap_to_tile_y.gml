///snap_to_tile_y(y,offset)

var yy = argument0
var offset = argument1
var newy = floor(yy/16)*16;
newy+=offset;

show_debug_message("snapped to "+string(newy));

return newy;
