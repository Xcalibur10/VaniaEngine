///Autotiling


var rw = floor(room_width/16);
var rh = floor(room_height/16);

for(i=0;i<rw;i++)
{
    for(j=0;j<rh;j++)
    {
        var tile = tile_layer_find(100,i*16,j*16);
        
        if(tile > 0 and global.grid[# i,j]==tm_solid) then
        {
            var tileset = tile_get_background(tile);
            tile_delete(tile);
            autotile(i*16,j*16,tileset,100);
        }
    }
}
    
