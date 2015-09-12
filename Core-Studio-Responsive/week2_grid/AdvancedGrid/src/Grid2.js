// JavaScript Document
var canvas = document.getElementById('canvas');
var width;
var height;
canvas.width = width =  window.innerWidth;
canvas.height = height = window.innerHeight;
var ctx = canvas.getContext('2d'); // https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D

var squareWidth = 20;
var squareHeight = 20;
var sw;
var positionX = -20;
var minWidth = squareWidth/20; 
var maxWidth = squareWidth-minWidth;
var limitX = 20
var counter=0;
//Small tricks to make sur that our height will not be divisble by 2 (otherwise we don't see a grid, but lines) 
var heightAdaptation = (Math.ceil(height/squareHeight)%2==1)?height/squareHeight:(height+20)/squareHeight;
for(var i = 0;i<width;i++){
	sw = minWidth + adjusted(limitX-i);
	if(i==limitX+10){
		limitX = i+10;
	}
	for(var j = 0;j<heightAdaptation;j++){
		//alpha value between 0 and 1;
		var alpha = 1;//(10 +sw*3)/100;
		if(counter%2==0){
			ctx.fillStyle = 'rgba(0,0,0,'+alpha+')';
		}else{
			ctx.fillStyle = 'rgba(255,255,255,'+alpha+')';	
		}
		ctx.fillRect(positionX+sw,j*squareHeight,sw,squareHeight);
		counter++;
	}
	positionX+=sw;
}

function adjusted(num){
	if(num<0){
		num = num*-1;
		}
	if(num>maxWidth){
		num = maxWidth;
		}
	return num;
}