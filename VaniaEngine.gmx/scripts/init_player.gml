hsp = 0;
vsp = 0;

m_hsp=0;
m_vsp=0;

e_hsp=0;
e_vsp=0;

x_axis = 0
y_axis = 0

final_hsp=0;
final_vsp=0;

//Stores bounding box data
tb = bb_top();
bb = bb_bottom();

lb = bb_left();
rb = bb_right();

r_hit = false;
l_hit = false;
t_hit = false;
b_hit = false;

//-----------------------------
grav_str = 0.4;
jump_force = 4.5;

grounded = false;
grounded_cache = 0;
onslope = false;
onstair = false;
stairbelow = false;
laststairtile = -1;
was_onstair = false;
facing = 1;
attack_timer = 0;
i_frames = 0;
kb_time=0;


predictslope = false;
jumped = false;
crouching = false;
onplatform = false;
platform_id = noone;



x_spd = 0
//spd_normal = 6.141
spd_normal = 1
spd_slope = 0.0;
stair_spd = 0.6;
spd = spd_normal;

intrusion = 0;

state = st_idle;
//sub_state = st_none;

max_hp=100
hp=max_hp;

mask_index = sprite_index;

