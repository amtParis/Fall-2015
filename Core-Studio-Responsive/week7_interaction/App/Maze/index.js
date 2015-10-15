var w = window.innerWidth;
var h = window.innerHeight;
var canvas = document.getElementById('canvas');
canvas.width = w;
canvas.height = h;
var ctx = canvas.getContext('2d');

var allSpiders = []; // array that will stock all our Spiders (prototypes)
var spiderAmount = 50;
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
    
    ctx.fillStyle = '#ffffff';
    ctx.fillRect(0,0,w,h);
       
    for(var i=0;i<spiderAmount;i++){
        var randomXPosition = w/2;
        var randomYPosition = h;
        var mySpider = new Spider(randomXPosition,randomYPosition,ctx,spiderAnimationInfos,spiderTexture);
        allSpiders.push(mySpider);
    }
    

    draw();
}


function draw(){
    //ctx.clearRect(0,0,w,h);
    //ctx.fillStyle = '#ffffff';
    //ctx.fillRect(0,0,w,h);
    
    for(var i=0;i<allSpiders.length;i++){
        allSpiders[i].update();
        allSpiders[i].move();
        allSpiders[i].display();
    }
    
    
    requestAnimationFrame(draw);
}



loadAssets();