/*================================================================
This script handles collision and character movement based on
the tile informations store by store_tiles script
It loops through collision points on all 4 sides to check for
tiles and stop the player and place it back to the last 
free position.
===============================================================*/
var xx=0;
var yy=0;

//Basic inputs
x_axis = keyboard_check(sys.rt_key)-keyboard_check(sys.lt_key);
y_axis = keyboard_check(sys.dn_key)-keyboard_check(sys.up_key);

if(x_axis<>0)
{
//facing=sign(x_axis);
}

if(onplatform >= 1)
{ 
    if(instance_exists(platform_id))
    {
        m_hsp=platform_id.hsp;
    }
    else
    {
        onplatform = 0;
    }
}



//UPDATE POSITION (X)
if(state = st_idle or (state=st_attack and !grounded) and state!=st_knockback)
{
    hsp = x_axis*spd;
}
final_hsp = hsp+m_hsp+e_hsp;

//CHECK FOR STAIRS AND MOVE HORIZONTALLY!!!
if(!onstair)
{
    x+=final_hsp;
}
else
{
    x+=final_hsp*stair_spd;
}

//handle_platform(0);

update_aabb();
//COLLISION CODE================================================
//LEFT COLLISION CHECK  
for(i=0;i<=2;i++)
{

if(final_hsp<0)
      {
      if(i==1 and crouching) then i++;
      h = lerp(bb-1,tb+1,i/2);
      
      yy = floor(h/16);     
      xx = floor((lb)/16);
    
      if(xx<0) xx=0;
      if(yy<0) yy=0;
      
      if(get_cell(lb,h,0,0)==tm_solid) and (onstair<1 or was_onstair = false)
        {
        intrusion = 16-((lb)-xx*16);
        x+=intrusion;
        hsp=0;
        m_hsp=0;
        break;
        }
      }
}

update_aabb();
//RIGHT COLLISION CHECK    
for(i=0;i<=2;i++)
{
    if(final_hsp>0)
    {
        if(i==1 and crouching) then i++;
        h = lerp(bb-1,tb+1,i/2);
        
        yy = floor(h/16); 
        xx = floor((rb)/16);
        
        if(xx<0) xx=0;
        if(yy<0) yy=0; 
    
        //if(global.grid[# xx, yy]==tm_solid) and (onstair<1 or was_onstair = false)
        if(get_cell(rb,h,0,0)==tm_solid) and (onstair<1 or was_onstair = false)
        {
            intrusion = ((rb)-xx*16);
            x-=intrusion;
            hsp=0;
            m_hsp=0;
            break;
        }
    }
}

//Staircase codes!!!
right_stair();
left_stair();


//VERTICAL PART OF THE JOURNEY
//Crouching
if(keyboard_check(sys.dn_key) and grounded) or !grounded
{
    //sprite_index=spr_small;
    mask_index = spr_mask_small;
    if(grounded)
    {
        spd = spd_slope;
        crouching = true;
    }

}
else
{
    var air_cell = (get_cell(bb_left()+1,bb_top()-8,0,0) == tm_solid or get_cell(bb_right()-1,bb_top()-8,0,0) == tm_solid)
    if(!air_cell or onstair>0)
    {
        mask_index = spr_mask_thin;
        spd = spd_normal;
        crouching = false;
    }
}

//JUMPING=================================================
if(keyboard_check_pressed(sys.jp_key)) then {sys.jp_cache = 5}

if(state<>st_knockback)
{
    if((sys.jp_cache>0 and crouching = false) and (grounded or grounded_cache>0) and jumped = false) then
    {
        vsp=-jump_force;
        jumped = true;
        sys.jp_cache = 0;
        mask_index = spr_mask_small;
        onplatform=0;
        m_hsp=0;
        m_vsp=0;
        platform_id=noone;
    }
}

if(grounded and sys.jp_cache <= 0)
{
    jumped = false;
}

if(keyboard_check(sys.jp_key) == 0 and vsp < 0)
{
    vsp *= 0.1;
}


//Gravity!!!
if(!grounded and !onstair and !onplatform)
{
    vsp+=grav_str;
}

//Limit our falling speed
if(vsp>=6) then
{
    vsp = 6;
}

left_stair_leave();
right_stair_leave();

grounded_cache-=spd_normal;


//UPDATE POSITION (Y) 


grounded = false;
if(onstair>0)
{
    grounded = true;
}

//Move with platform (y)
if(onplatform=2)
{
    if(instance_exists(platform_id))
    {
        update_aabb();
        m_vsp=platform_id.vsp;
        vsp=0;
        grounded=true;
    }

}

if(instance_exists(platform_id))
{
    if(onplatform=2 and y>platform_id.y+8)
    {
        onplatform=0;
        m_hsp=0;
        m_vsp=0;
        platform_id=noone;
        grounded = false;
    }
}


final_vsp = vsp+m_vsp+e_vsp;
if(onstair<1)
{
    y+=final_vsp;
}
else
{
    if(get_tile_at(x,y)=tm_stair_r) then onstair=stair_on_right;
    if(get_tile_at(x,y)=tm_stair_l) then onstair=stair_on_left;
    
    if(onstair==stair_on_right)
    {
        y-=final_hsp*stair_spd;   
    }
    else
    if(onstair==stair_on_left)
    {
        y-=final_hsp*-stair_spd;   
    }
}

//Process platform
if(onplatform=1)
{
    onplatform=2;
    grounded_cache = 4;

    grounded=true;
    jumped = false;
    
    var x_offset=platform_id.x-floor(platform_id.x);
    x=floor(x)+x_offset;
    y=platform_id.y-9;   
}

//show_debug_message(hsp);

//Reset grounded state, if we are on a platform, it'll be true anyway...


//BOTTOM COLLISION CHECK================================================
lb=bb_left();
rb=bb_right();

//var hit_ceiling = global.grid[# floor(lb+1)/16, floor((bb_top()-1)/16)]=tm_solid or global.grid[# floor(rb-1)/16, floor(bb_top()-1)/16]=tm_solid
var hit_ceiling = get_cell(lb+1,bb_top(),0,0)=tm_solid or get_cell(rb-1,bb_top(),0,0)=tm_solid;

//MOVING PLATFORMS
//Get on moving platform<><><><><><><><><><><><>
for(i=0;i<=2;i++)
{
    var w = lerp(lb+1,rb-1,i*0.5);

    if(collision_point(w,y+1,par_mplatform,0,0) and onplatform=0 and (vsp>=0) and onstair=0 and !hit_ceiling)
    {
    
        platform_id = instance_position(w,y+1,par_mplatform);
        if(platform_id<>noone and yprevious<=platform_id.y-8)
        {
            onplatform = 1;
            y=platform_id.y-9;
            grounded = true;
            grounded_cache = 6;
            if(state=st_knockback)
            {
                state=st_idle;
                e_vsp=0;
                e_hsp=0;
            }
            
        }
    }
}

//getting off moving platform><><><><><><><><><><><><
    if(!(collision_point(lb+1,y+1,par_mplatform,0,0) or collision_point(rb-1,y+1,par_mplatform,0,0)) and onplatform=2)
    {
        onplatform = 0;
        grounded = false;
        m_hsp=0;
        m_vsp=0;
        platform_id=noone;
    }
    

//hitting ceiling when standing on platform -> GET OFF MAH PLATFORM! NOW!
    if(hit_ceiling and onplatform>0)
    {
        //show_debug_message("hit ceiling, push down!")
        onplatform = 0;
        grounded = false;
        m_hsp=0;
        m_vsp=0;
        vsp=0;
        y+=2;
        platform_id=noone;
    }

//show_debug_message("vsp before collision check: "+string(final_vsp));
    
var solid_stair = false;
//Bottom grid collision handle>>>>>>>>>>>>>>>>>>>>>>>
if(final_vsp >= 0)
{
    
    for(i=0;i<=2;i+=1)
    {
        update_aabb();
        var w = lerp(lb+1, rb-1, i*0.5);
        xx = floor(w/16);
        yy = floor((bb)/16);

    
        if(floor((y+1)/16)>yprevious_tile)
        {
            solid_stair=(get_cell(w,bb,1,0)=tm_solid and get_cell(w,bb,0,0)=tm_stair_end_top and get_cell(w,bb,-1,0)=tm_solid);
        }                    
                    
    show_debug_message("solid_stair="+string(solid_stair)); 
    
    if((get_cell(w,bb,0,0)=tm_solid or solid_stair) and final_vsp >= 0)
        {
        bb = bb_bottom();
        intrusion = ((bb)-yy*16);
        if(final_vsp>=0 and onstair<1)
            {
            was_onstair = false;
            
            if(grounded=false)
            {
                //attack_timer = 0;
            }
            if(state=st_knockback)
            {
                state=st_idle;
                e_vsp=0;
                e_hsp=0;
            }
            
            grounded = true;
            grounded_cache = 4;
            vsp = 0;
            m_hsp = 0;
            m_vsp = 0;
            onstair = 0;
            onplatform = 0;
            y-=intrusion;
            }
        break;
        }
    }
}

//TOP COLLISION CHECK============================

//Top grid collision handle
if(final_vsp < 0)
{
    for(i=0;i<=1;i+=0.5)
    {
    
    update_aabb();
    var w = lerp(lb+1, rb-1, i)
    intrusion = 0;     
    xx = floor(w/16);
    yy = floor((tb)/16);
    
    //Don't let xx and yy lower than 0
    if(xx<0) xx=0;
    if(yy<0) yy=0;
    
    h = sprite_get_height(mask_index)
    
    //if(global.grid[# xx, yy]=tm_solid and (onstair<1 and was_onstair = false))    
    if(get_cell(w,tb,0,0)==tm_solid and (onstair<1 and was_onstair = false))

        {
        if(state=st_knockback)
            {
                e_vsp=0;
            }
        vsp=0;
        m_vsp=0;
        intrusion = ((bb-h)-yy*16);
        //show_debug_message("INT: "+string(intrusion));
        y+=16-intrusion;
        }
    }
}

player_attack();


//LEVEL BORDERS========================================================
//LEFT
if(x<8) then {hsp = 0; x = 8;}
//RIGHT
if(x>room_width-8) then {hsp = 0 x = room_width-8};
