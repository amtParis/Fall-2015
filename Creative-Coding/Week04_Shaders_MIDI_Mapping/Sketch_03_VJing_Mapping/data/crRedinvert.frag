// RED INVERT

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

    float e = 2.718281828459045235360287471352;
    vec4 col = texture2D(texture, vertTexCoord.st) * vertColor;
    
    vec3 k =   vec3(0.4, 0.2, 0.2);
    vec3 min = vec3(1.0, 0.0, 0.0);
    vec3 max = vec3(0.0, 1.0, 1.0);
    
    col.r = (1.0 / (1.0 + pow(e, (-k.r * ((col.r * 2.0) - 1.0) * 20.0))) * (max.r - min.r) + min.r);
    col.g = (1.0 / (1.0 + pow(e, (-k.g * ((col.g * 2.0) - 1.0) * 20.0))) * (max.g - min.g) + min.g) * coef * random1;
    col.b = (1.0 / (1.0 + pow(e, (-k.b * ((col.b * 2.0) - 1.0) * 20.0))) * (max.b - min.b) + min.b) * val1 * random1;
    //col.a = opacity;
        
    gl_FragColor = col;

}