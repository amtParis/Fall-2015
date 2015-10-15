var w = window.innerWidth;
var h = window.innerHeight;
var canvas = document.getElementById('canvas');
canvas.width = w;
canvas.height = h;
var ctx = canvas.getContext('2d');

var spiderTexture;
var spiderCoordinates;
var allSpiders = [];
var spiderNbr = 30;
var request = new XMLHttpRequest();
var assets = [ {"jsn":'json/spider.json',"texture":'data/spider.png'} ];

var rythm = 0;


function loadAssets(){

	 request.onreadystatechange = function(){
      if( request.readyState == request.DONE && request.status == 200 ) {
        spiderCoordinates = JSON.parse(request.responseText);
        spiderTexture = new Image();
        spiderTexture.src = assets[0].texture;
        spiderTexture.onload = setup();
      }
        
    }
    
    request.open('GET', assets[0].jsn);
    request.send();

}

function setup(){

	 for(var i=0;i<spiderNbr;i++){
         var posx = window.innerWidth/2;// Math.random()*w;
         var posy = window.innerHeight/2;// Math.random()*h;
        // allSpiders[i] = new Spider(posx,posy,ctx,spiderTexture,spiderCoordinates);
    }
    

    draw();

}

function draw(){

	ctx.fillStyle = 'rgba(255,255,255,1)';//"#ffffff";
	ctx.fillRect(0,0,w,h);
    
    if(rythm%25==0){
        var posx = window.innerWidth/2;
        var posy = window.innerHeight/2;
        allSpiders.push( new Spider(posx,posy,ctx,spiderTexture,spiderCoordinates));
    }
    

	 for(var i=0;i<allSpiders.length;i++){
        allSpiders[i].update();
         allSpiders[i].move();
         allSpiders[i].draw();
         
         if( allSpiders[i].y<0){
             allSpiders.shift();
         }
    }
    rythm++;
	requestAnimationFrame(draw);
}

loadAssets();