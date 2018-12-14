///draw_self_palette()

shader_set(NES_color);
    texture_set_stage(pal_s,pal_t);
    draw_self();
shader_reset();
