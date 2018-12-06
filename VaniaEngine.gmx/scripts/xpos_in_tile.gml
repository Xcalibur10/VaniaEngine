///xpos_in_tile(return_float)
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
    return ((x) mod 16);
//    return ((x-1) mod 16);
}
else
{
    return floor((x) mod 16);
//    return floor((x-1) mod 16);
}
