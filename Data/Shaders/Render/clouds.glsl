###VERTEX

#version 120

#define in attribute
#define out varying

//
// Clouds's inputs are directly in NDC coordinates
//

// Inputs
in vec4 inSharedAttribute0; // Position (vec2), TextureCoordinates (vec2)

// Outputs
out vec2 texturePos;

void main()
{
    gl_Position = vec4(inSharedAttribute0.xy, -1.0, 1.0);
    texturePos = inSharedAttribute0.zw;
}

###FRAGMENT

#version 120

#define in varying

// Inputs from previous shader
in vec2 texturePos;

// The texture
uniform sampler2D paramCloudTexture;

// Parameters        
uniform float paramAmbientLightIntensity;

void main()
{
    vec4 textureColor = texture2D(paramCloudTexture, texturePos);
    gl_FragColor = vec4(textureColor.xyz * paramAmbientLightIntensity, textureColor.w);
} 
