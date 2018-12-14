///draw_self_palette()
var spr_ind=argument0;
var img_ind=argument1;
var xx=argument2;
var yy=argument3;
var xscale=argument4;
var yscale=argument5;
var rot=argument6;
var col=argument7;
var alpha=argument8;


shader_set(NES_color)   
    texture_set_stage(pal_s,pal_t);
    draw_sprite_ext(spr_ind,img_ind,xx,yy,xscale,yscale,rot,col,alpha);
shader_reset();
