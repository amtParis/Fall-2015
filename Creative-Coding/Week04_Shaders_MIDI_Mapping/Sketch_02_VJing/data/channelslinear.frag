// CHANNELS LINEAR

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

//

uniform float timer;
uniform float coef;

uniform float val1;

uniform float random1;

uniform float opacity;

void main(void) {	

	vec2 texCoord = vertTexCoord.st;

	vec2 offset = vec2(cos(val1), sin(val1))  * coef * random1;

	vec4 red = texture2D(texture, texCoord + offset);
	vec4 green_alpha = texture2D(texture, texCoord);
	vec4 blue = texture2D(texture, texCoord - offset);
	
	gl_FragColor = vec4(red.r, green_alpha.g, blue.b, opacity == 0 ? 1 : opacity);

}