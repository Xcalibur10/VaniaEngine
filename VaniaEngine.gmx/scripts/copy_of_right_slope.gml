//SLOPE HANDLING RIGHT (TODO) 
update_aabb()   


xx = floor((rb-1)/16);
intrusion = round((rb)-xx*16);
yy = floor((bb+1)/16); 
if(intrusion<=8) then
{
    yy = floor((bb-1)/16);
    show_debug_message("bottom of slope");
}
 
//show_debug_message("bounding_box_bottom: "+string(bb))
show_debug_message(intrusion)
//show_debug_message(global.grid[# xx, yy])

if(global.grid[# xx, yy]="s")
{

//intrusion = round((rb)-xx*16);
//show_debug_message(string(y)+" | "+string(intrusion))  

if(y>=((yy+1)*16)-intrusion)
    {
    grounded = true;
    vsp = 0;
    y=((yy+1)*16)-(intrusion); //correcting y compared to the grid position below (yy+1)
    //show_debug_message(intrusion)
    }
    else
    {
    grounded = false;
    }
}
