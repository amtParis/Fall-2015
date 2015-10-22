var w = window.innerWidth;
var h = window.innerHeight;
var canvas = document.getElementById('canvas');
canvas.width = w;
canvas.height = h;
var ctx = canvas.getContext('2d');

var allSpiders = []; // array that will stock all our Spiders (prototypes)
var spiderAmount = 20;
var assets  = ["data/spider.png","json/spider.json"];
var request = new XMLHttpRequest();
var spiderAnimationInfos;
var spiderTexture;

function loadAssets(){
    
    request.onreadystatechange = function(){
       
        if(request.readyState == request.DONE && request.status == 200){
            spiderAnimationInfos = JSON.parse(request.responseText);
            spiderTexture = new Image();
            spiderTexture.src = assets[0];
            spiderTexture.load = setup();
        }
    }
    
    request.open('GET',assets[1]);
    request.send();
}


function setup(){
       
    for(var i=0;i<spiderAmount;i++){
        var randomXPosition = Math.random()*w;
        var randomYPosition = Math.random()*h;
        var mySpider = new Spider(randomXPosition,randomYPosition,ctx,spiderAnimationInfos,spiderTexture);
        allSpiders.push(mySpider);
    }
    
   
    
   // var screamActive = false;
    document.addEventListener( 'devicemotion', function( ev ) {
                              var accel = ev.accelerationIncludingGravity;
                             //  console.log( accel.x, accel.y, accel.z );
                              for(var i=0;i<allSpiders.length;i++){
                                // rotate on X
                                  if(allSpiders[i].touched && (Math.round(accel.x)>=10 || Math.round(accel.x)<=-10)){
                                    allSpiders[i].slide( Math.round(accel.x) );
                                  }
                                // rotate on Y
                                  if(allSpiders[i].touched && (Math.round(accel.y)>=10 || Math.round(accel.y)<=-10)){
                                    allSpiders[i].slideY( Math.round(accel.y) );
                                  }
                              }
                            }, false );
    
    document.addEventListener('touchstart',function(e){
                              
                             //Kill it
                               for(var i=0;i<allSpiders.length;i++){
                                allSpiders[i].check(e.changedTouches[0].pageX,e.changedTouches[0].pageY);
                              }
                              
                              });

    draw();
}


function draw(){
    //ctx.clearRect(0,0,w,h);
    ctx.fillStyle = '#ffffff';
    ctx.fillRect(0,0,w,h);
    
    for(var i=0;i<allSpiders.length;i++){
        allSpiders[i].update();
        allSpiders[i].move();
       allSpiders[i].display();
    }
    
    
    requestAnimationFrame(draw);
}



loadAssets();