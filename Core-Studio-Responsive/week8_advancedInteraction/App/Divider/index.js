//empty
var w = window.innerWidth;
var h = window.innerHeight;
var canvas = document.getElementById('canvas');
canvas.width = w;
canvas.height = h;
var ctx = canvas.getContext('2d');

var top,left;
var radius = 100;
var center = {"x":w/2,"y":h/2};

function setup(){
    
    top = h/2 - h/4;
    left = w/2 -w/4;

    canvas.addEventListener("touchend",function(e){
        var posx = e.changedTouches[0].pageX;
        var posy = e.changedTouches[0].pageY;
       /* console.log("x",posx);
        console.log("y",posy);*/
         
                            
       
      if( posx>left && posx<left+w/2 && posy>top && posy<top+h/2){
              console.log("i m inside the rectangle");
                            }else{
                             console.log("i m outside the rectangle");
                            }
       
       
                            
        
                            //circle
        var distance = getDistance(posx,posy,center.x,center.y);
        if(distance<=radius){
            console.log("i m inside the circle");
        }else{
            console.log("i m outside the circle");
                            }

                            
                            
    });
    
   
    
    draw();
}

function getDistance(x1,y1,x2,y2){
    return Math.sqrt( Math.pow((x1-x2), 2) + Math.pow((y1-y2), 2) );
}

function draw(){
    ctx.fillStyle = '#ffffff';
    ctx.fillRect(0,0,w,h);
    
    
    ctx.fillStyle = '#000000';
    ctx.fillRect(left,top,w/2,h/2);
    ctx.fillStyle = '#ff0000';
   ctx.arc(center.x,center.y,100,0,2*Math.PI,true);
    ctx.fill();
    
    requestAnimationFrame(draw);
}

setup();