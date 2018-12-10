//Get off the stairs!!!
var check_solid = get_cell(bb_left()+1,y,0,0)=tm_solid or 
                  get_cell(bb_right()-1,y,0,0)=tm_solid or
                  get_cell(bb_left()+1,y,0,-1)=tm_solid or
                  get_cell(bb_right()-1,y,0,-1)=tm_solid;
                                    

if(onstair=stair_on_left and y_axis>0 and keyboard_check_pressed(sys.jp_key) and !check_solid)
{
    onstair=0;
    vsp = 0;
}

var off_stair_bottom=get_cell(x,y,-1,-1)=tm_stair_end_bottom and final_hsp>0;
var off_stair_top=(get_cell(x,y,1,1)=tm_stair_end_top) and final_hsp<0;

if(onstair=stair_on_left and ypos_in_tile(false)<=15 and (off_stair_top or off_stair_bottom))
{
    show_debug_message("OFF STAIR L")
    //y+=ypos_in_tile()
    snap_to_tile_y(y,15)
    onstair=0;
    vsp = 0;
}
