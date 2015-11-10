var w = window.innerWidth;
var h = window.innerHeight;
var canvas = document.getElementById('canvas');
canvas.width = w;
canvas.height = h;
var ctx = canvas.getContext('2d');


var request = new XMLHttpRequest();
var allCharacters = [];
var datas;

function loadAssets(){
    request.onreadystatechange = function(){
        if( request.readyState == request.DONE && request.status == 200 ) {
            datas = JSON.parse(request.responseText);
            setup();
        }
    }
    request.open('GET', "json/characters.json");
    request.send();
}

function setup(){
    for(var i = 0; i<datas.characters.length ; i++){
        var character = new Character(datas.characters[i],ctx);
        character.init();
        allCharacters.push(character);
    }
    
    document.addEventListener('touchstart',function(e){
         for(var i = 0;i<allCharacters.length;i++){
           allCharacters[i].scale = 1;
         }
    });
    
    draw();
}

function draw(){
    ctx.fillStyle = 'white';
    ctx.fillRect(0,0,w,h);
    for(var i = 0;i<allCharacters.length;i++){
       //optional reposition
       allCharacters[i].y = -40;
       //optional scaling
       // create a bouncing effect
       allCharacters[i].scaleX(4);
       allCharacters[i].display();
    }
    requestAnimationFrame(draw);
}

loadAssets();