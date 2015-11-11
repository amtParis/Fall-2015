
var Particle = function( x, y, radius ) {
	this.init( x, y, radius );
}

Particle.prototype = {

	init: function( x, y, radius ) {

		this.alive = true;

		this.radius = radius || 10;
		this.wander = 0.15;
		this.theta = Math.random()*Math.PI*2;
		
		this.drag = 0.92;
		this.color = '#fff';

		this.x = x || 0.0;
		this.y = y || 0.0;

		this.vx = 0.0;
		this.vy = 0.0;
	},

	move: function() {

		this.x += this.vx;
		this.y += this.vy;

		this.vx *= this.drag;
		this.vy *= this.drag;

		this.theta += randomFloat( -0.5, 0.5 ) * this.wander;
		this.vx += Math.sin( this.theta ) * 0.1;
		this.vy += Math.cos( this.theta ) * 0.1;

		this.radius *= 0.96;
		this.alive = this.radius > 0.5;
	},

	draw: function( ctx ) {

		ctx.beginPath();
		ctx.arc( this.x, this.y, this.radius, 0, Math.PI*2 );
		ctx.fillStyle = this.color;
		ctx.fill();
	}
};

// ----------------------------------------
// Example
// ----------------------------------------

var w = window.innerWidth;
var h = window.innerHeight;
var canvas = document.getElementById('canvas');
canvas.width = w;
canvas.height = h;
var ctx = canvas.getContext('2d');


var MAX_PARTICLES = 280;
var COLOURS = [ '#69D2E7', '#A7DBD8', '#E0E4CC', '#F38630', '#FA6900', '#FF4E50', '#F9D423' ];

var particles = [];
var pool = [];

//FPS FINE TUNING
var fps = 60;
var now;
var then = Date.now();
var interval = 1000/fps;
var delta;


function setup(){

	// Set off some initial particles.
	var i, x, y;
	var r1,r2;

	for ( i = 0; i < 20; i++ ) {
		x = ( w * 0.5 ) + random( -100, 100 );
		y = ( h * 0.5 ) + random( -100, 100 );
		spawn( x, y );
	}

	

	document.addEventListener("touchmove", onMouseMove);
	draw();
}

function update(){

	var i, particle;

	for ( i = particles.length - 1; i >= 0; i-- ) {

		particle = particles[i];

		if ( particle.alive ) particle.move();
		else pool.push( particles.splice( i, 1 )[0] );
	}

}

function draw(){
	requestAnimationFrame(draw);

/*
	now = Date.now();
    delta = now - then;
     
    if (delta > interval) {
        // update time stuffs
         
        // Just `then = now` is not enough.
        // Lets say we set fps at 10 which means
        // each frame must take 100ms
        // Now frame executes in 16ms (60fps) so
        // the loop iterates 7 times (16*7 = 112ms) until
        // delta > interval === true
        // Eventually this lowers down the FPS as
        // 112*10 = 1120ms (NOT 1000ms).
        // So we have to get rid of that extra 12ms
        // by subtracting delta (112) % interval (100).
        // Hope that makes sense.
         
        then = now - (delta % interval);
         
        // ... Code for Drawing the Frame ...
        ctx.clearRect(0,0,w,h);
		update();
		for ( var i = particles.length - 1; i >= 0; i-- ) {
			particles[i].draw( ctx );
		}
    }
    */
     //ctx.clearRect(0,0,w,h);
     ctx.globalCompositeOperation  = 'source-over';
     ctx.fillStyle = '#2b2b2b';
     ctx.fillRect(0,0,w,h);
     ctx.globalCompositeOperation  = 'lighter';
		update();
		for ( var i = particles.length - 1; i >= 0; i-- ) {
			particles[i].draw( ctx );
		}
}

function spawn(x,y){
	if ( particles.length >= MAX_PARTICLES )
			pool.push( particles.shift() );

		particle = pool.length ? pool.pop() : new Particle();
		particle.init( x, y, random( 5, 40 ) );

		particle.wander = randomFloat( 0.5, 2.0 );
		particle.color = randomArray( COLOURS );
		particle.drag = randomFloat( 0.9, 0.99 );

		theta = Math.random()*Math.PI*2;
		force = random( 2, 8 );

		particle.vx = Math.sin( theta ) * force;
		particle.vy = Math.cos( theta ) * force;

		particles.push( particle );

}

function onMouseMove(e){
	var particle, theta, force, touch, max, i, j, n;

	
	for ( i = 0, n = e.touches.length; i < n; i++ ) {

		touch = e.touches[i], max = random( 1, 4 );
		for ( j = 0; j < max; j++ ) spawn( touch.pageX, touch.pageY );
	}
	
}

function random(min,max)
{
    //return Math.floor(Math.random()*(max-min+1)+min);
    return Math.floor(Math.random()*(max-min)+min);
}

function randomFloat(min,max)
{
    //return Math.random()*(max-min+1)+min;
    return Math.random()*(max-min)+min;
}
function randomArray(array)
{
    return array[Math.floor(Math.random()*array.length)];
}

setup();
