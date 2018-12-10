///move_to_room()
//Allows player to go to a new room, properly offsets positions.

var plr = argument[0];

//RIGHT
if(plr.x>=room_width-8)
{
    var rx = get_new_room_x()+1;
    var ry = get_new_room_y();
    var new_room = "rm_"+string(rx)+"_"+string(ry);
    show_debug_message(new_room);
    var room_index = asset_get_index(new_room);
    if(room_exists(room_index))
    {
        global.previous_room = room;
        room_goto(room_index);
        global.is_new_room = 1;
    }
}

//LEFT
if(plr.x<=8)
{
    var rx = get_new_room_x()-1;
    var ry = get_new_room_y();
    var new_room = "rm_"+string(rx)+"_"+string(ry);
    show_debug_message(new_room);
    var room_index = asset_get_index(new_room);
    if(room_exists(room_index))
    {
        global.previous_room = room;
        room_goto(room_index);
        global.is_new_room = 3;
    }
}

//DOWN
if(plr.y>room_height)
{
    var rx = get_new_room_x();
    var ry = get_new_room_y();
    var new_room = "rm_"+string(rx)+"_"+string(ry);
    show_debug_message(new_room);
    var room_index = asset_get_index(new_room);
    if(room_exists(room_index))
    {
        global.previous_room = room;
        room_goto(room_index);
        //plr.y=0
        global.is_new_room = 4;
        
    }
}

//UP
if(plr.y<0)
{
    var rx = get_new_room_x();
    var ry = get_new_room_y();
    var new_room = "rm_"+string(rx)+"_"+string(ry);
    show_debug_message(new_room);
    var room_index = asset_get_index(new_room);
    if(room_exists(room_index))
    {
        global.previous_room = room;
        room_goto(room_index);
        //plr.y=room_height;
        global.is_new_room = 2;
        
    }
}
