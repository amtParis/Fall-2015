var w = window.innerWidth;
var h = window.innerHeight;
var canvas = document.getElementById('canvas');
canvas.width = w;
canvas.height = h;
var ctx = canvas.getContext('2d');

var myWorld;
var coordinates = {"x":0,"y":0}; // this is the memory

function setup(){
    
    myWorld = new World(0,0,ctx);
    
    //addInteraction
    document.addEventListener('touchstart',function(e){
        //myWorld.isTouched = true;
        coordinates.x = e.touches[0].pageX;
        coordinates.y = e.touches[0].pageY;
        myWorld.isTouched  = !myWorld.checkWords(e.touches[0].pageX,e.touches[0].pageY);
        
        console.log(myWorld.isTouched);
        
    });
    document.addEventListener('touchend',function(e){
        myWorld.isTouched = false;
        myWorld.unsetWords();
    });
    document.addEventListener('touchmove',function(e){
      var diffX = e.touches[0].pageX - coordinates.x;
      var diffY = e.touches[0].pageY - coordinates.y;

      if( myWorld.isTouched ){
        //make a condition to avoid black border
        myWorld.x+=diffX;
        myWorld.y+=diffY;
        
      }else{
        myWorld.moveWords(diffX,diffY);
      }
                              
      coordinates.x = e.touches[0].pageX;
      coordinates.y = e.touches[0].pageY;
                              
    });
    
    draw();
}

function draw(){
    //console.log("i'm drawing");
    ctx.clearRect(0,0,w,h);
    myWorld.display();

    requestAnimationFrame(draw);
}

setup();