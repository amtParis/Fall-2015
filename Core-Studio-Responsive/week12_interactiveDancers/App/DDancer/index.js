var w = window.innerWidth;
var h = window.innerHeight;
var canvas = document.getElementById('canvas');
canvas.width = w;
canvas.height = h;
var ctx = canvas.getContext('2d');


var request = new XMLHttpRequest();
var allCharacters = [];
var datas;

var backgroundTexture;
var myTime=null;
var remover = [];
var counter = 0;
var allSounds = [];

function loadAssets(){
    request.onreadystatechange = function(){
        if( request.readyState == request.DONE && request.status == 200 ) {
            datas = JSON.parse(request.responseText);
            setup();
        }
    }
    request.open('GET', "json/characters2.json");
    request.send();
}

function loadAllSounds(){
       for(var i=0;i<datas.characters.length;i++){
        var audio = document.createElement('audio');
        audio.src = datas.characters[i].sound;
        audio.preload = true;
        audio.loop = false;
        audio.load();
        document.body.appendChild(audio);
        allSounds.push(audio);
    }
}

function setup(){
    
    backgroundTexture = new Image();
    backgroundTexture.src = 'data/background_dancer.jpg';
    /*
    for(var i = 0; i<datas.characters.length ; i++){
        var character = new Character(datas.characters[i],ctx);
        character.isShowing = false;
        character.init();
        allCharacters.push(character);
    }
    */
    
    //loadAllSounds();
   
    
    document.addEventListener('touchstart',function(e){
       clearTimeout(myTime);
       myTime = setTimeout(function(){
               // ALL YOUR ACTIONS
               if(e.touches.length>0){
                   //CREATE NEW CHARACTER
                   var character = new Character(datas.characters[e.touches.length-1],ctx);
                   //character.init(allSounds[e.touches.length-1]);
                   character.init();

                   //set a initial size
                   // if combined with a forced size on the draw, it create a bouncing effect
                   character.scale = 0.01;
                   // this sets random final size for having more variations between characters
                   // by default this value can be set to 1
                   character.finalScale = Math.random()+0.5;
                   character.name = "character_"+counter;
                   character.isShowing = true;
                   character.x = e.touches[0].pageX;
                   character.y = e.touches[0].pageY;
                   
                   allCharacters.push(character);
                   counter++
               }}, 25);
            
    });
    
    draw();
}

function draw(){
     //ctx.fillStyle = '#C28ADA';
    // ctx.fillRect(0,0,w,h);
     ctx.drawImage(backgroundTexture,0,0,w,h);
    remover = [];
    for(var i = 0;i<allCharacters.length;i++){
        //Force a size
        //you can make it bigger easily
        
        if( allCharacters[i].isShowing == true){
            allCharacters[i].scaleX(allCharacters[i].finalScale);
            allCharacters[i].move();
            allCharacters[i].display();
            allCharacters[i].checkCollision(allCharacters);
        }
        //check if character are out of the screen
        if( !allCharacters[i].isout){
            remover.push(allCharacters[i]);
        }
    }
    allCharacters = remover.slice(0);
    
    
    
    requestAnimationFrame(draw);
}

loadAssets();