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
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//This is the same "palette" what is in the texture_set_stage line
uniform sampler2D palette;



void main()
{
    float col;
    vec4 result;
    
    //Get the colorizable sprite's r channel level (0=0 to 1=255 )
    col = texture2D(gm_BaseTexture, v_vTexcoord).r*0.66;
    col = clamp(col,0.0,0.66);
    
    result.rgb = texture2D(palette,vec2(col,0.5)).rgb;
    result.a = texture2D(gm_BaseTexture, v_vTexcoord).a;
    
    gl_FragColor = result;
}
