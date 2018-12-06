///handle_slope(bb_side,bb_bot,slope_tile,slope_side)


//Bounding Box Positions
var bb_side = argument0;
var bb_bot = argument1;
var slope_tile = argument2;;


xx = floor((bb_side)/16);
yy = floor((bb_bot-1)/16);

if(global.grid[# xx, yy]=argument2)
    {
    update_aabb();
    var slope_side = argument3;
    show_debug_message("SLOPE: "+string(slope_side))
    
    intrusion = round((bb_side)-xx*16);
    if(slope_side == 0) then
    {
        show_debug_message("bottom of slope LEFT");
        yy = floor((bb_bot+1)/16); 
        if(intrusion>=8) then
        {
            yy = floor((bb_bot-1)/16);
            show_debug_message("half-left");
        }
    }
    
    if(slope_side == 1) then
    {
        show_debug_message("bottom of slope RIGHT");
        yy = floor((bb_bot+1)/16); 
        if(intrusion<=8) then
        {
            yy = floor((bb_bot-1)/16);
            show_debug_message("half-right");
        }
    }
}
//show_debug_message("bounding_box_bottom: "+string(bb))
//show_debug_message(intrusion)
//show_debug_message(global.grid[# xx, yy])

if(global.grid[# xx, yy]=argument2)
{

//intrusion = round((rb)-xx*16);
//show_debug_message(string(y)+" | "+string(intrusion))  

    if(y>=((yy+1)*16)-intrusion)
    {
    show_debug_message("Intrusion: "+string(intrusion))
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
