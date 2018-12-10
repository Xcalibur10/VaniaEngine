update_aabb()   

//GET ON THE STAIR FROM BOTTOM!
if(get_cell(x,y,0,0)=tm_stair_end_bottom and onstair=0 and get_cell(x-1,y-1,-1,-1)=tm_stair_l)
{
if(final_vsp>=0 and final_hsp<0 and grounded and xpos_in_tile()>=11 and y_axis<0)
    {
    grounded = true;
    was_onstair = true;
    vsp = 0;
    x=snap_to_tile_x(x,15);
    //x-=xpos_in_tile(true)-15;
    onstair = 2
    }
}

//GET ON THE STAIR FROM TOP!
//if(global.grid[# xx, yy]=tm_stair_l)
if(get_cell(x,y,0,1)=tm_stair_end_top and y_axis<0)
{
if(final_vsp>=0 and final_hsp>0 and grounded and xpos_in_tile()<=4 and xpos_in_tile()>=0)
    {
    grounded = true;
    was_onstair = true;
    vsp = 0;
    //x-=xpos_in_tile(true);
    x=snap_to_tile_x(x,1);
    //y+=ypos_in_tile(true);
    onstair = 2
    }
}

