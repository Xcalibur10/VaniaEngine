///outside_view(threshold)
var threshold = argument[0];

if(x-threshold>view_xview[0]+view_wview[0])
{
    return true;
    exit;
}
if(x+threshold<view_xview[0])
{
    return true;
    exit;
}
if(y-threshold>view_yview[0]+view_hview[0])
{
    return true;
    exit;
}
if(y+threshold<view_yview[0])
{
    return true;
    exit;
}
return false;

