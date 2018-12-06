//SLOPE HANDLING RIGHT (TODO) 
update_aabb()   

var center = (rb+lb)*0.5;

var xx = floor(center/16);
intrusion = 16-((center)-xx*16);

var yy = floor((bb+sign(final_hsp)+final_vsp)/16);

if(global.grid[# xx, yy]="d" and vsp>=0) then
{
   show_debug_message("get on slope");
   if(final_hsp>0)
   {
       y+=8;
   }

if((y>=((yy+1)*16)-intrusion))
{
    {
    y=((yy+1)*16)-(intrusion); //correcting y compared to the grid position below (yy+1)
    grounded = true;
    onslope  = 1;
    vsp = 0;
    m_vsp = 0;
    }
}
}
show_debug_message("Slope tile: "+ string(onslope));
