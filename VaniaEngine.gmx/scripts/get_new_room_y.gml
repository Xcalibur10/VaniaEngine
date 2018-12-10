///get_new_room()
var room_n = room_get_name(room);
room_n = string_delete(room_n, 1, 3);

var room_x = "";
var room_y = "";

var room_x_found=false;

for(var rn=1;rn<=string_length(room_n);rn++)
{
    var next_char = string_char_at(room_n,rn);
    if(next_char <> "_")
    {
        if(room_x_found==false)
        {
            room_x+=next_char;
        }
        else
        {
            room_y+=next_char;
        }  
    }
    else
    {
        room_x_found=true;
    }
}

room_y=real(room_y);
return room_y+ypos_in_room();

