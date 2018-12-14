var ds_room_wrapper = ds_map_create();
var ds_map = ds_map_create();
var ds_properties = ds_map_create();
var ds_tiles = ds_map_create();
var ds_layers = ds_map_create();


var w=floor(room_width/256);
var h=floor(room_height/192);
var bg_list;
var ts_list;
var ts_data;

//GET BACKGROUND NAMES, STORE THEM!
for(var n=0;n<8;n++)
{
    bg_list[n]=ds_map_create();
    ds_map_add(bg_list[n],"back",background_get_name(background_index[n]));
    ds_map_add(bg_list[n],"parallax_x",string(0.7)); 
    ds_map_add(bg_list[n],"parallax_y",string(0.7));
    ds_map_add(bg_list[n],"offset_x",string(0));
    ds_map_add(bg_list[n],"offset_y",string(0));
}


//STORE BASIC ROOM DATA
ds_properties[? "w"]=string(w);
ds_properties[? "h"]=string(h);
ds_properties[? "map_x"]=string(5);
ds_properties[? "map_y"]=string(4);


//CHECK FOR TILESET! STORE THEM ONLY ONCE! INIT
var tileset_list = ds_list_create();
var tx=w*16;;
var ty=h*16;

//CHECK FOR TILESET! STORE THEM ONLY ONCE! LOOP!
for(var xx=0;xx<tx;xx++)
{
    for(var yy=0;yy<ty;yy++)
    {
        var tile  = tile_layer_find(100,xx*16,yy*16);
        var bg_added=false;
        if(tile>-1)
        {
            var bg=background_get_name(tile_get_background(tile));
            for(ls=0;ls<ds_list_size(tileset_list);ls++)
            {
                if(bg==tileset_list[| ls] and bg_added=false)
                {
                    bg_added=true;
                }
            }
            if(bg_added==false)
            {
                ds_list_add(tileset_list,bg);
                ds_tileset[ds_list_size(tileset_list)]=ds_map_create();
            }
        }
    }
}

for(var d=0;d<ds_list_size(tileset_list);d++)
{
    show_debug_message(tileset_list[| d]);
}

//STORE THE TILESETS!
//GET BACKGROUND NAMES, STORE THEM!

//TILE LAYERS
ds_map_add_map(ds_room_wrapper,"map",ds_map);
    ds_map_add_map(ds_map,"properties",ds_properties);
        for(var n=0;n<8;n++)
        {
            ds_map_add_map(ds_properties,"bg_"+string(n),bg_list[n]);
        }
    ds_map_add_map(ds_map,"tiles",ds_tiles);
    ds_map_add_map(ds_tiles,"main",ds_layers);

    for(var n=0;n<ds_list_size(tileset_list);n++)
    {
        ts_list[n]=ds_map_create();
        ds_map_add_map(ds_layers,"ts_"+string(n),ts_list[n])
        ts_data[n]=ds_map_create();
        ds_map_add(ts_list[n],"tileset",tileset_list[| n]);
        //var tile_list = 
        //ds_map_add
    }
    
    


//ENCODE JSON, SAVE INTO FILE
var r=json_encode(ds_room_wrapper);
    show_debug_message(string(r));
var json_file = file_text_open_write(working_directory+"maps/data/rooms/ds_room.json");



file_text_write_string(json_file,r);
file_text_close(json_file);

//ds_list_destroy(ds_room);
//ds_map_destroy(ds_room_map);

show_debug_message("ROOM SAVED");
