///sprite_controller(idle,walk,jump,fall,attack)

var s_idle = argument0;
var s_walk = argument1;
var s_jump = argument2;
var s_fall = argument3;
var s_attack1 = argument4;
var s_knockback



if(state=st_idle and !crouching)
{
    if(onstair==0)
    {
        if(grounded)
        {
            if(x_axis<>0)//if(hsp<>0)
            {
                facing=sign(x_axis);
                sprite_index=s_walk;
                image_speed = abs(hsp*0.1)+0.1;
            }
            else
            {
                //facing=sign(x_axis);
                sprite_index=s_idle;
                image_speed = 0.1;
            }
        }
        else
        {
            sprite_index=s_jump;
            if(hsp<>0)
            {
                facing=sign(x_axis);
                image_xscale=facing;
            }
        }
    }
    if(onstair>0)
    {  
        if(hsp>0)
        {
            if(onstair=stair_on_right)
                sprite_index=spr_mir_walk_stair_up;
            if(onstair=stair_on_left)
                sprite_index=spr_mir_walk_stair_dn;
            facing=1
            image_xscale=facing;
        }
        else
        if(hsp<0)
        {
            if(onstair=stair_on_right)
                sprite_index=spr_mir_walk_stair_dn;
            if(onstair=stair_on_left)
                sprite_index=spr_mir_walk_stair_up;
            facing=-1
            image_xscale=facing;
        }
        image_index=0.25+xpos_in_tile(false)/4;
    }
}

if(state=st_idle and crouching)
{
    sprite_index=spr_mir_crouch;
    if(x_axis<>0)
    facing=sign(x_axis);
    //if(hsp<>0)
    {

        image_xscale=facing;
        image_speed = abs(hsp*0.2);
    }
}

if(state=st_attack)
{
    if(crouching or !grounded)
    {
        sprite_index=spr_mir_attack_crouch;
    }
    else
    {
        sprite_index=spr_mir_attack;
    }
    
    if(attack_timer=22)
    {
        image_index=0;
        image_speed=0.35;
    }
    if(attack_timer<=0)
    {
        facing=sign(x_axis);
    }
}

if(state=st_knockback)
{
    sprite_index=spr_mir_kb;
    image_index=0;
}

image_xscale = facing;
