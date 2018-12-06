//Get off the stairs!!!
if(onstair=stair_on_right and y_axis>0 and keyboard_check_pressed(sys.jp_key))
{
    onstair=0;
    vsp = 0;
}

//var off_stair_bottom=((get_cell(x,y-1,0,0)=tm_stair_end_bottom) or (get_cell(x,y-1,0,-1)=tm_stair_end_bottom)) and final_hsp<0;
var off_stair_bottom=((get_cell(x,y,1,-1)=tm_stair_end_bottom)) and final_hsp<0;
if(off_stair_bottom)
{
    //show_debug_message("off_stair! "+string(x)+" | "+string(y)+" >> "+string(off_stair_bottom));
}


var off_stair_top=(get_cell(x,y,-1,1)=tm_stair_end_top) and final_hsp>0;

if(onstair=stair_on_right and ypos_in_tile(false)<=15 and (off_stair_top or off_stair_bottom))
{
    show_debug_message("OFF STAIR R")
    snap_to_tile_y(y,15)
    onstair=0;
    vsp = 0;
}
