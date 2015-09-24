// LEDs

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

//

uniform float coef;

uniform float val1;

uniform float random1;


/*************************************************************
*Shader by: Jason Gorski
*Email: jasejc 'at' aol.com
*CS594 University of Illinios at Chicago
*
*LED Shader Tutorial
*For more information about this shader view the tutorial page
*at http://www.lighthouse3d.com/opengl/ledshader or email me
*************************************************************/

#define KERNEL_SIZE 9

uniform int pixelSize; //size of bigger "pixel regions". These regions are forced to be square

//uniforms added since billboard1

// a tolerance used to determine the amount of blurring 
// along the edge of the circle defining our "pixel region"
uniform float tolerance; 

//the radius of the circle that will be our "pixel region", values > 0.5 hit the edge of the "pixel region"
uniform float pixelRadius; 

vec2 texCoords[KERNEL_SIZE]; //stores texture lookup offsets from a base case

void main() {

	vec2 uv = vertTexCoord.st;

	// TODO increase luminance
	
	int pixelSizeW = 40;
	int pixelSizeH = 20;
	
	// a value used to determine the gradient from pixel region color to the black used to seperate the regions.
	// The higher you make this value the more blurry the edges of your circles will get
	
	float tolerance = coef;
	
	//  radius of the circle defining our pixel regions. This should have a range [0.0 - 1.0] for reasons you will understand later.
	// Beginning at 0.5 the circles will begin to hit the edge of their pixel regions and they'll look more like rounded squares. 
	// At 1.0 you will have a square.
	
	//float pixelRadius = .1; // between 0 and 1
	float pixelRadius = val1 * random1;


     //will hold our averaged color from our sample points
     vec4 avgColor; 
     
     //width/height of "pixel region" in texture coords
     vec2 texCoordsStep = vec2(1.0/float(pixelSizeW), 1.0/float(pixelSizeH)); 
     
     //x and y coordinates within "pixel region"
     vec2 pixelRegionCoords = fract(uv/texCoordsStep);
     
     //"pixel region" number counting away from base case 
     vec2 pixelBin = floor(uv/texCoordsStep); 
     
     //width of "pixel region" divided by 3 (for KERNEL_SIZE = 9, 3x3 square)
     vec2 inPixelStep = texCoordsStep/3.0; 
     vec2 inPixelHalfStep = inPixelStep/2.0;

    //use offset (pixelBin * texCoordsStep) from base case 
     // (the lower left corner of billboard) to compute texCoords
     vec2 offset = pixelBin * texCoordsStep;
     
     
     texCoords[0] = vec2(inPixelHalfStep.x, inPixelStep.y*2.0 + inPixelHalfStep.y) + offset;
     texCoords[1] = vec2(inPixelStep.x + inPixelHalfStep.x, inPixelStep.y*2.0 + inPixelHalfStep.y) + offset;
     texCoords[2] = vec2(inPixelStep.x*2.0 + inPixelHalfStep.x, inPixelStep.y*2.0 + inPixelHalfStep.y) + offset;
     texCoords[3] = vec2(inPixelHalfStep.x, inPixelStep.y + inPixelHalfStep.y) + offset;
     texCoords[4] = vec2(inPixelStep.x + inPixelHalfStep.x, inPixelStep.y + inPixelHalfStep.y) + offset;
     texCoords[5] = vec2(inPixelStep.x*2.0 + inPixelHalfStep.x, inPixelStep.y + inPixelHalfStep.y) + offset;
     texCoords[6] = vec2(inPixelHalfStep.x, inPixelHalfStep.y) + offset;
     texCoords[7] = vec2(inPixelStep.x + inPixelHalfStep.x, inPixelHalfStep.y) + offset;
     texCoords[8] = vec2(inPixelStep.x*2.0 + inPixelHalfStep.x, inPixelHalfStep.y) + offset;

     //take average of 9 pixel samples
     avgColor = texture2D(texture, texCoords[0]) +
                         texture2D(texture, texCoords[1]) +
                         texture2D(texture, texCoords[2]) +
                         texture2D(texture, texCoords[3]) +
                         texture2D(texture, texCoords[4]) +
                         texture2D(texture, texCoords[5]) +
                         texture2D(texture, texCoords[6]) +
                         texture2D(texture, texCoords[7]) +
                         texture2D(texture, texCoords[8]);

     avgColor /= float(KERNEL_SIZE);

     //blend between fragments in the circle and out of the circle defining our "pixel region"
     //Equation of a circle: (x - h)^2 + (y - k)^2 = r^2
     
     vec2 powers = pow(abs(pixelRegionCoords - 0.5),vec2(2.0));
     float radiusSqrd = pow(pixelRadius,2.0);
     float gradient = smoothstep(radiusSqrd-tolerance, radiusSqrd+tolerance, powers.x+powers.y);

     gl_FragColor = mix(avgColor, vec4(0.1,0.1,0.1,1.0), gradient);
}