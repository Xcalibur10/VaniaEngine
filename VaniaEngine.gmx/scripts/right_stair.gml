update_aabb()   


//show_debug_message("bottom: "+string(get_cell(x,y,0,0)));
//show_debug_message("stair_r: "+string(get_cell(x+1,y-1,1,-1)));

//GET ON THE STAIR FROM BOTTOM!
//if(get_cell(x,y,-1,0)=tm_stair_end_bottom and get_cell(x,y,0,0)=tm_stair_r and onstair=0)
if(get_cell(x,y,0,0)=tm_stair_end_bottom and onstair=0 and get_cell(x+1,y-1,1,-1)=tm_stair_r)
{
if(final_vsp>=0 and final_hsp>0 and grounded and xpos_in_tile()<=4 and y_axis<0)
    {
    grounded = false;
    was_onstair = true;
    vsp = 0;
    x=snap_to_tile_x(x,1);
    //x-=xpos_in_tile(true)-1;
    onstair = 3
    }
}

//GET ON THE STAIR FROM TOP!
//if(global.grid[# xx, yy]=tm_stair_l)
//if(get_cell(x,y,1,0)=tm_stair_end_top and get_cell(x,y,0,1)=tm_stair_r and y_axis<0)
if(get_cell(x,y,0,1)=tm_stair_end_top and y_axis<0)
{
if(final_vsp>=0 and final_hsp<0 and grounded and xpos_in_tile()>=11)
    {
    grounded = false;
    was_onstair = true;
    vsp = 0;
    x=snap_to_tile_x(x,16);
    //y+=ypos_in_tile(true);
    onstair = 3
    }
}

