global.rooms = ds_grid_create(25,25);
ds_grid_clear(global.rooms,-1);
global.previous_room = 0;

ini_open("full_map.ini");

for(var rx=0;rx<25;rx++)
{
    for(var ry=0;ry<25;ry++)
    {
        var rm_index=asset_get_index("rm_"+string(rx)+"_"+string(ry));
        if(room_exists(rm_index))
        {
            global.rooms[# rx, ry] = rm_index;
            ini_write_string("map", string(rx)+"_"+string(ry), rm_index);
            show_debug_message("ROOM "+room_get_name(rm_index)+" FOUND AND ADDED");

        }
    }
}

ini_close();
