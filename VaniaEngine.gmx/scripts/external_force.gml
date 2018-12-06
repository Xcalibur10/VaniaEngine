var fr=0.05

if(e_hsp<>0)
{
    if(e_hsp>0) e_hsp-=fr;
    else
    if(e_hsp<0) e_hsp+=fr;
}

if(e_vsp<>0)
{
    if(e_vsp>0) e_vsp-=fr;
    else
    if(e_vsp<0) e_vsp+=fr;
}

e_hsp = clamp(e_hsp,-5,5);
e_vsp = clamp(e_vsp,-5,5);

if(e_hsp=0 and state=st_knockback)
{
    //state=st_idle;
}
