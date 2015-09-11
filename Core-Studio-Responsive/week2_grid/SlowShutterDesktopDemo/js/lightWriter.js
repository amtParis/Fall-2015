// JavaScript Document
var canvas = document.getElementById('canvas');
var width;
var height;
canvas.width = width =  window.innerWidth;
canvas.height = height = window.innerHeight;
var ctx = canvas.getContext('2d');

var word = "hello amt";
var decoder = new Decoder();


var bigMemory = [];
var counter = 0;

var squareEdge = 20;
var spacer = 30;
var center = width/2-squareEdge/2;
var haut = 300;

function setup(){
	//parse all letters
	var allLetters = word.split("");
	for(var i=0;i<allLetters.length;i++){
		var _bin = decoder.getBinary(allLetters[i]);
			for(var k=0;k<_bin[0].length;k++){
				column = Array();
				for(var j=0;j<_bin.length;j++){
					column.push(_bin[j][k]);
				}
				bigMemory.push(column);
			}
		//space between letters
		bigMemory.push(decoder.getBinary(" "));
	}

		//space at the end of the sentence
		bigMemory.push(decoder.getBinary(" "));
		bigMemory.push(decoder.getBinary(" "));

	draw();
}


function draw(){
	if(counter%2==0){
	
		ctx.clearRect(0,0,width,height);

		for(var i=0;i<bigMemory[0].length;i++){
			if(bigMemory[0][i]==1){
				//ctx.fillRect(center,haut+i*(squareEdge + spacer),squareEdge,squareEdge);
				ctx.fillStyle = 'red';//'#'+Math.random().toString(16).substr(-6);

				ctx.beginPath();
				ctx.ellipse(center,haut+i*(squareEdge + spacer), squareEdge,squareEdge, 0, 0, 2 * Math.PI);
				
				ctx.closePath();
				ctx.fill();
			}
		
		}
		var shifted = bigMemory.shift();
		bigMemory.push(shifted);

	}
	

	counter++;
	requestAnimationFrame(draw);
}


setup();