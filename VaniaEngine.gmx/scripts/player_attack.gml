if(state=st_knockback)
{
    exit;
}


attack_timer -= 1;
if(keyboard_check_pressed(sys.at_key) and attack_timer<=0)
{
    state = st_attack;

    attack_timer = 22;

}

if(attack_timer = 17)
{
    var yy=-18;
    if(crouching or !grounded) yy=-12;
    
    
    var proj = instance_create(x+facing*12,y+yy,obj_proj);
    proj.hsp=facing*2.5;
    proj.image_speed=0.15;
    proj.image_xscale=sign(facing);
    proj.dmg=1;
    proj.life=20;
    proj.creator = id;
}

if(state = st_attack)
{
    if(grounded)
    {
        hsp=0;
    }
}

if(attack_timer <= 0)
{
    attack_timer=0;
    state = st_idle;
}
