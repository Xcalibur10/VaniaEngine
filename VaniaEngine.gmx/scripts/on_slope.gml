update_aabb();
yy = floor((bb+2)/16);

var slope_tile = ""

for(i=0;i<=1;i++)
{
    if(i==0) then
    {
        slope_tile = "s"
        xx = floor((bb_right()-1)/16);
        intrusion = floor((bb_right())-xx*16);
    }
    else
    {
        slope_tile = "d"
        xx = floor((bb_left()+1)/16);
        intrusion = floor((bb_left())-xx*16);
    }
    if(global.grid[# xx, yy]=slope_tile)
    {
        if(y>=((yy+1)*16)-intrusion)
        {
            return true;
        }
    }
}
return false;
