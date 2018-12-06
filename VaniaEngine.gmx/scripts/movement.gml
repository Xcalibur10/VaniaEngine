//UNUSED SCRIPT!
x+=x_axis*x_spd;

for(i=0;i<=3;i++)
{

//LEFT COLLISION CHECK   

    yy = floor((y-1-(i*7))/16);     
    xx = floor((x+8)/16);
    if(global.grid[# xx, yy]=tm_solid)
    {
    show_debug_message("wall hit!")
    x=(xx*16)-8;
    }

//RIGHT COLLISION CHECK    

    xx = floor((x-8)/16);
    if(global.grid[# xx, yy]=tm_solid)
    {
    show_debug_message("wall hit!")
    x=((xx+1)*16)+8;
    }
}

y+=y_axis*x_spd;



for(i=-1;i<=1;i++)
{

//BOTTOM COLLISION CHECK

xx = floor((x+(i*7))/16)
yy = floor(y/16);
if(global.grid[# xx, yy]=tm_solid)
    {
    show_debug_message("wall hit!");
    y=yy*16;
    }

//TOP COLLISION CHECK
    
xx = floor((x+(i*7))/16);
yy = floor((tb-1)/16);
if(global.grid[# xx, yy]=tm_solid)
    {
    show_debug_message("top wall hit!");
    show_debug_message(yy*16+(bb-y))
    y=(yy*16)+(bb-y+1);

    }
}



