//SLOPE HANDLING RIGHT (TODO) 
update_aabb()   
xx = floor((rb-1)/16);
intrusion = floor((rb)-xx*16);

yy = floor((bb-1)/16);

if(intrusion>8) then
{
    yy = floor((bb+2)/16);
    //show_debug_message("top of slope");
}
 
//show_debug_message("bounding_box_bottom: "+string(bb))
show_debug_message(intrusion)
//show_debug_message(global.grid[# xx, yy])

if(global.grid[# xx, yy]="v")
{

//intrusion = round((rb)-xx*16);
//show_debug_message(string(y)+" | "+string(intrusion))  

if(y>=((yy+1)*16)-intrusion*0.5)
    {
    grounded = true;
    vsp = 0;
    y=((yy+1)*16)-(intrusion*0.5); //correcting y compared to the grid position below (yy+1)
    //show_debug_message(intrusion)
    }
    else
    {
    grounded = false;
    }
}
if(global.grid[# xx, yy]="b")
{

//intrusion = round((rb)-xx*16);
//show_debug_message(string(y)+" | "+string(intrusion))  

if(y>=(((yy+1)*16)-intrusion*0.5)-8)
    {
    grounded = true;
    vsp = 0;
    y=(((yy+1)*16)-(intrusion*0.5))-8; //correcting y compared to the grid position below (yy+1)
    //show_debug_message(intrusion)
    }
}
