///ypos_in_tile(return_float)
if(argument_count==1)
{
    is_float = argument[0];
}
    else
{
    is_float = false
}

if(is_float == true)
{
    return (y) mod 16;
}
else
{
    return floor((y) mod 16);
}
