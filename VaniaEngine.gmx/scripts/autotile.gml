///autotile(xx,yy,tileset,depth)



var counter = 0;

var xx=argument0;
var yy=argument1;
var tileset = argument2;
var tile_depth = argument3;

var lt=get_cell(xx,yy,-1,0);
var up=get_cell(xx,yy,0,-1);
var rt=get_cell(xx,yy,1,0);
var dn=get_cell(xx,yy,0,+1);

/*
if(lt==tm_solid or lt==0) then counter+=1;
if(up==tm_solid or up==0) then counter+=2;
if(rt==tm_solid or rt==0) then counter+=4;
if(dn==tm_solid or dn==0) then counter+=8;
*/

if(lt==tm_solid) then counter+=1;
if(up==tm_solid) then counter+=2;
if(rt==tm_solid) then counter+=4;
if(dn==tm_solid) then counter+=8;

var tx = 0;
var ty = 0;

switch (counter)
{
    case 0: {tx=6; ty=0; break;}
    case 1: {tx=5; ty=0; break;}
    case 2: {tx=5; ty=1; break;}
    case 3: {tx=2; ty=2; break;}
    case 4: {tx=3; ty=0; break;}
    case 5: {tx=4; ty=0; break;}
    case 6: {tx=0; ty=2; break;}
    case 7: {tx=1; ty=2; break;}
    case 8: {tx=3; ty=1; break;}
    case 9: {tx=2; ty=0; break;}
    case 10: {tx=4; ty=1; break;}
    case 11: {tx=2; ty=1; break;}
    case 12: {tx=0; ty=0; break;}
    case 13: {tx=1; ty=0; break;}
    case 14: {tx=0; ty=1; break;}
    case 15: {tx=1; ty=1; break;}
}

xx=floor(xx/16)*16;
yy=floor(yy/16)*16;

tile_add_grid(xx,yy,tileset,tx,ty,tile_depth,tm_solid)
