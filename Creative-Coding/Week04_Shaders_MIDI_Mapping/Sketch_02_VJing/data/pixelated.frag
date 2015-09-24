#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

//

uniform float coef;

uniform float val1;

uniform float random1;

void main() {

	vec2 texCoord = vertTexCoord.st;

	float size = coef/ 25 * (random1 == 0 ? 1 : random1);
	
	float dx = size;
    float dy = size / val1;
    
    vec2 coord = vec2(dx * floor(texCoord.x / dx), dy * floor(texCoord.y / dy));
  
	gl_FragColor = texture2D(texture, coord);    


}