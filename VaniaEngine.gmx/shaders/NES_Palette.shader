//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//

/*
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
float posterize = 4.0;

sampler2D pal;

int arr[4];
vec3 new_col;

//---------FUNCTIONS-------------
vec3 int_to_rgb(float col)
{ 
    vec3 rgb_comp = vec3(0,0,0);
  
    rgb_comp.b = mod(col,256.0);
    float d = col / 256.0;
    rgb_comp.g = mod(d,256.0);
    d = col / 256.0 / 256.0;
    rgb_comp.r =  mod(d,256.0);
    
    return rgb_comp;
}

float rgb_to_int(vec3 rgb_comp)
{
    float int_final = 
    rgb_comp.r*65536.0+
    rgb_comp.g*256.0+
    rgb_comp.b;
    
    return int_final;
}

//-------------------------------------

void main()
{
arr[0] = 40000;
arr[1] = 1000;
arr[2] = 2000;
//arr[3] = int(16711680);



    vec3 c = texture2D(gm_BaseTexture, v_vTexcoord).rgb;
    vec3 c_rounded = c-arr[0];
    for(int i=0;i<2;i++)
    {
        new_col = c-arr[i];
    }
    //c = c*posterize;
    //c = floor(c);
    //c = c/posterize;
    gl_FragColor = vec4(new_col, texture2D(gm_BaseTexture, v_vTexcoord).a);
}
*/

//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
float posterize = 8.0;


void main()
{
    vec3 c = texture2D(gm_BaseTexture, v_vTexcoord).rgb;
    c = c*posterize;
    c = floor(c);
    c = c/posterize;
    gl_FragColor = vec4(c, texture2D(gm_BaseTexture, v_vTexcoord).a);
}

