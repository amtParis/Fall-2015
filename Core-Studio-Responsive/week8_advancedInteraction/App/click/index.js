var w = window.innerWidth;
var h = window.innerHeight;
var canvas = document.getElementById('canvas');
canvas.width = w;
canvas.height = h;
var ctx = canvas.getContext('2d');
var allSpiders = [];
var spiderAmount = 5000;
var assets = ["data/spider.png", "json/spider.json"];
var request = new XMLHttpRequest();
var spiderAnimationInfos;
var spiderTexture;
var mySpider;
function loadAssets(){
    request.onreadystatechange = function(){
        if(request.readyState== request.DONE && request.status == 200){
            spiderAnimationInfos = JSON.parse(request.responseText);
            spiderTexture = new Image();
            spiderTexture.src = assets[0];
            spiderTexture.onload = setup();
        }
    }
    request.open('GET', assets[1]);
    request.send();
}
function setup(){
    //for (var i = 0;i<spiderAmount;i++){
      //  var randomXPosition = Math.random()*w;
        //var randomYPosition = Math.random()*h;
        // console.log(spiderAnimationInfos);
        //var mySpider = new spider(randomXPosition,randomYPosition, ctx, spiderAnimationInfos,spiderTexture);
        //allSpiders.push(mySpider);
    //}
    
    canvas.addEventListener(  "touchend",  function(e){  
                            
       console.log("**********")
                            var randomXPosition = e.changedTouches[0].pageX;
                            var randomYPosition = e.changedTouches[0].pageY;
       var mySpider = new Spider(randomXPosition,randomYPosition, ctx, spiderAnimationInfos,spiderTexture);
                            allSpiders.push(mySpider);

    });
    
    document.addEventListener( 'devicemotion', function( ev ) {
                              var accel = ev.accelerationIncludingGravity;
                              console.log( accel.x, accel.y, accel.z );
                              }, false );
    
    draw();
}
function draw(){
    ctx.fillStyle= 'rgb(255,255,255)';
    ctx.fillRect(0,0,w,h);
    //ctx.clearRect(0,0,w,h);
    for(var i = 0; i<allSpiders.length; i++){
        allSpiders[i].update();
        allSpiders[i].move();
        allSpiders[i].display();
    }
    requestAnimationFrame(draw);
}
loadAssets();
//setup();