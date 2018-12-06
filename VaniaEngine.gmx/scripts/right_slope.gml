//SLOPE HANDLING RIGHT (TODO) 
update_aabb()   
xx = floor((rb)/16);
intrusion = floor((rb)-xx*16);


yy = floor((bb+1)/16);
 
//show_debug_message("bounding_box_bottom: "+string(bb))
show_debug_message(intrusion)
//show_debug_message(global.grid[# xx, yy])

if(global.grid[# xx, yy]="s")
{

if(y>((yy+1)*16))
    {
    grounded = true;
    vsp = 0;
    y=((yy+1)*16)-(intrusion); //correcting y compared to the grid position below (yy+1)
    //show_debug_message(intrusion)
    }
}
