// INVERT

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

uniform float coef;

uniform float random1;

uniform float val1;

uniform float opacity;

void main() {

	vec2 texCoord = vertTexCoord.st;

	vec4 col = texture2D(texture, texCoord);;

	col.r = (1.0 - col.r) * random1;
	col.g = (1.0 - col.g) * random1;
	col.b = (1.0 - col.b) * random1;
	col.a = opacity;
	
	gl_FragColor = col;

}