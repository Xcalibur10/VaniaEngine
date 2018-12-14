///init_palettes(pal_id)


//THESE VARIABLES ARE ACCESSED FROM DRAW_SELF_PALETTE AND DRAW_SPRITE_PALETTE SCRIPTS
pal_id = argument[0];

pal_s = shader_get_sampler_index(NES_color,"palette");
pal_t = sprite_get_texture(spr_palettes,pal_id);
//-----------------------------------------


if(argument_count==0)
{
    sub_img = 0;
}
else
{
    sub_img = pal_id;
}
