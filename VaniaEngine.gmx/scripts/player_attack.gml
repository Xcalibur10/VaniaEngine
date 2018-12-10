if(state=st_knockback)
{
    exit;
}


attack_timer -= 1;
if(keyboard_check_pressed(sys.at_key) and attack_timer<=0)
{
    state = st_attack;
    image_index=0;
    attack_timer = atk_spd;

}

if(attack_timer = floor(atk_spd*0.70))
{
    var yy=-18;
    if(crouching or !grounded) yy=-12;
    
    
    var proj = instance_create(x+facing*12,y+yy,obj_proj);
    proj.hsp=facing*2.5;
    proj.image_speed=0.15;
    proj.image_xscale=sign(facing);
    proj.dmg=4;
    proj.life=20;
    proj.creator = id;
}

if(state = st_attack)
{
    if(grounded or (!grounded and onstair>0))
    {
        hsp=0;
    }
}

if(attack_timer <= 0)
{
    attack_timer=0;
    state = st_idle;
}
