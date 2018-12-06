///handle_platform(axis)

axis=argument0;

for(i=0;i<=2;i+=1)
{
update_aabb();

var w = lerp(lb+1, rb-1, i*0.5);
xx = w;
yy = bb;

if(platform_id == noone)
{
   platform_id = (collision_point( w, bb, par_mplatform, 0, 1 ));
   
}
else
{
   intrusion = (bb-platform_id.tb);
   show_debug_message("Intrusion: "+ string(intrusion));
}
var ononeway = (platform_id>0) and intrusion<=1+(vsp+m_vsp);
show_debug_message(ononeway)
/*
if(ononeway == true and keyboard_check(sys.dn_key) and keyboard_check_pressed(sys.jp_key))
{
    vsp=0;
    grounded = false;
    y+=2;
    ononeway = false;
    break;
}
*/
    if(ononeway)
    {
        grounded = true;



        if(axis==0)
        {
           m_hsp=platform_id.hsp;  
        }
        else
        {
           m_vsp=platform_id.vsp;
           y-=intrusion;
           vsp = 0;
           grav=0;
        }
        
        update_aabb();
    }
    platform = collision_point( w, bb, par_mplatform, 0, 1 );
    if(platform != noone) then
    {
        //onplatform=false;
        //grounded = false;
        //platform_id = noone;
        //m_hsp = 0;
        //m_vsp = 0;
    }
}
