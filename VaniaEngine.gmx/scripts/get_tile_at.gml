///get_tile_at(x,y)
if(argument_count<=1)
then
{
    var xx = floor(x/16)
    var yy = floor(y/16)
}
else
{
    var xx = floor(argument[0]/16)
    var yy = floor(argument[1]/16)
}


return global.grid[# xx, yy];
