#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

// Everything above is set/used by Processing


// Custom parameters
// Updated from Processing using shader.set("name_of_the_parameter", value);

uniform float your_custom_parameter;


// Main program, where the magic happens

void main(void) {

	// Get the texture coordinates in 2D, ranging from 0 to 1
	vec2 texCoord = vertTexCoord.xy;

	// You can apply modifications to the coordinates (before using it
	// and get the color) so the image will be shifted or zoomed, ...
	// To do so, you can change
	// texCoord.x
	// texCoord.y
	// You can also do calculations like
	// texCoord *= .6;
	// texCoord += .1;	


	// Get the color RGBA with values ranging from 0 to 1
	vec4 color = texture2D(texture, texCoord);
	
	// Now apply modifications to the color

	// ie: Invert the color
	color.r = (1.0 - color.r);
	color.g = (1.0 - color.g);
	color.b = (1.0 - color.b);
	
	// Set the color
	gl_FragColor = color;
}
