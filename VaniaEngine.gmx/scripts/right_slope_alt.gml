//SLOPE HANDLING RIGHT (TODO) 
update_aabb()   

var center = (rb+lb)*0.5;

var xx = floor(center/16);

var yy = floor((bb-sign(final_hsp)+final_vsp)/16);

var predict_slope=false;

if((global.grid[# xx, yy-1]="s" and global.grid[# xx, yy]=tm_solid) and final_vsp>=0) then
{
   intrusion = round((center)-xx*16);
   show_debug_message("SHIT IS FINALLY HAPPENING!");
   grounded = true;
   onslope  = 1;
   exit;
}

if(global.grid[# xx, yy]="s" and final_vsp>=0) then
{
   intrusion = round((center)-xx*16);
   show_debug_message("intrusion: "+string(intrusion));

   

//if((y>=((yy+1)*16)-intrusion))
{  
   {
    if(final_hsp<0)
    {
    y+=4;                          
    }
    y=((yy+1)*16)-(intrusion);     //correcting y compared to the grid position below (yy+1)

    grounded = true;
    onslope  = 1;
    vsp = 0;
    m_vsp = 0;
    }
}
}



show_debug_message("Slope tile: "+ string(onslope));
