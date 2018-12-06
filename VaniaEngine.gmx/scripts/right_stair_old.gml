//SLOPE HANDLING RIGHT (TODO) 
update_aabb()   
xx = floor((rb)/16);
intrusion = floor((rb)-xx*16);

yy = floor((bb+1)/16);
if(y_axis<0 and onstair=0) then yy = floor((bb-1)/16);
 
if(global.grid[# xx, yy]=tm_stair_r)
    stairbelow=true;
else
    stairbelow=false;

    
//GET ON THE STAIR!!!
if(global.grid[# xx, yy]=tm_stair_r and onstair=0 and y_axis<0)
{
show_debug_message("ON STAIR R")
if(final_vsp>=0 and final_hsp>0 and grounded and xpos_in_tile()>=0 and xpos_in_tile()<=4)
    {
    grounded = false;
    vsp = 0;
    x-=xpos_in_tile(true);
    //y=((yy+1)*16-1)
    y-=1;
    onstair = stair_stepping_on
    }
}

//Get off the stairs!!!
if(onstair=stair_on_right and y_axis>0 and keyboard_check_pressed(sys.jp_key))
{
    onstair=0;
    vsp = 0;
}

xx = floor((x+1)/16);
if(onstair=stair_on_right and ypos_in_tile(false)<=15 and global.grid[# xx, yy]=tm_solid)
{
    show_debug_message("OFF STAIR R")
    y+=ypos_in_tile()
    onstair=0;
    vsp = 0;
}
