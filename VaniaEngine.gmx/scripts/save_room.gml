ini_open("room.ini");
var rx=0;
var ry=0;

for(rx=0;rx<floor(room_width/16);rx++)
{
    for(ry=0;ry<floor(room_height/16);ry++)
    {
        var tile_id = tile_layer_find(100, rx*16, ry*16);
        if(tile_id!=-1)
        {
            var tileset = tile_get_background(tile_id);
            tileset = background_get_name(tileset);
            var tl = tile_get_left(tile_id)/16;
            var tt = tile_get_top(tile_id)/16;
            
            show_debug_message(string(tileset));
            ini_write_string(string(tileset),"y_"+string(ry),tt);
            ini_write_string(string(tileset),"x_"+string(rx),tl);

        }

    }
}
show_debug_message(string(rx*ry)+" tiles have been saved!");
ini_close();
show_debug_message("ROOM SAVED");
