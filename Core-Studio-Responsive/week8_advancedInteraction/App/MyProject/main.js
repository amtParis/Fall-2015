// we need to set the canvas stuff
var w = window.innerWidth;
var h = window.innerHeight;
var canvas = document.getElementById('canvas');
canvas.width = w;
canvas.height = h;
var ctx = canvas.getContext('2d');


// variables
var allInsects = [];


//setup function
function setup(){

    // create all Insects (based on the prototype)
    // and store it in the allInsects array
    // a for loop for storing the insects
    
    
    // set interaction
    // addEventListener for example
    // ...
    
    
    //call the draw function for the first time
    draw();
}


//draw function

function draw(){
    // erasing the stage
    ctx.fillStyle = 'rgb(0,0,255)';
    ctx.fillRect(0,0,w,h);
    
    //drawing the stage
    // add a for loop for drawing all insects
    // and call the update, move and display function of the prototype
    
    
    
    // for looping the animation
    requestAnimationFrame(draw);
}

// to launch our app, we need to call the setup first
setup();