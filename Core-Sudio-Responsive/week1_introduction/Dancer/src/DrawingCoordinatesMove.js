// JavaScript Document
var canvas = document.getElementById('canvas');
var width;
var height;
canvas.width = width =  window.innerWidth;
canvas.height = height = window.innerHeight;
var ctx = canvas.getContext('2d'); // https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D
document.addEventListener('mousedown', mOnClick);
var activate = false;

var SVGPoints = "371.8,348.2 452.8,350.2 557,367.5 565,319.5 457.4,301.7 372.4,299.6 319.1,299.6 319.1,270.7 354,270.7 354,195.7 374.3,195.7 396,174 390.7,168.7 393.1,165.7 387.1,160.8 389.3,157.4 382.7,153.2 384.6,149.4 377.6,145.8 379.2,141.6 371.7,138.7 372.9,134.2 365.1,132.1 365.8,127.2 357.8,125.9 358.1,120.7 350,120.3 349.7,114.8 341.6,115.2 340.7,109.5 332.8,110.8 332.8,110.8 331.2,105 327.9,105.9 316.3,94.3 311.5,99.1 311,98.2 310.3,98.6 305.5,94.7 302.3,98.8 300.5,96.1 297.6,97.9 294.8,96.1 293,98.8 289.8,94.7 285,98.6 284.2,98.2 283.8,99.1 278.9,94.3 267.4,105.9 264,105 262.5,110.8 262.5,110.8 254.5,109.5 253.6,115.2 245.6,114.8 245.3,120.3 237.2,120.7 237.4,125.9 229.4,127.2 230.2,132.1 222.4,134.2 223.6,138.7 216.1,141.6 217.7,145.8 210.6,149.4 212.6,153.2 206,157.4 208.2,160.8 202.2,165.7 204.6,168.7 199.3,174 221,195.7 241.3,195.7 241.3,270.7 276.2,270.7 276.2,299.6 222.9,299.6 137.9,301.7 30.3,319.5 38.3,367.5 142.5,350.2 223.5,348.2 273.3,348.2 273.3,451.9 241.3,451.9 192.7,451.9 192.7,500.5 192.7,613.2 143.4,613.2 143.4,661.8 192.7,661.8 241.3,661.8 241.3,613.2 241.3,500.5 273.3,500.5 321.9,500.5 354,500.5 354,613.2 354,661.8 402.6,661.8 451.8,661.8 451.8,613.2 402.6,613.2 402.6,500.5 402.6,451.9 354,451.9 321.9,451.9 321.9,348.2";

//getting all coordinates x,y
var XYcoordinates = SVGPoints.split(" ");



var angle = 0;
var aug = 100;
var augl = 10;
var augf = 10;
function draw(){

	ctx.clearRect(0,0,width,height);
	//we want to create a PATH
	ctx.beginPath();
	//loop
	for(var i = 0; i<XYcoordinates.length;i++){
		//drawlines
		//split the coordinate to have x and y position
		var XY = XYcoordinates[i].split(",");
		var x = parseFloat(XY[0]);
		var y = parseFloat(XY[1]);
		//we need to move to the first point

		if(activate){
			//ARMS MOVING
			if( (i>=1 && i<=4) ){
				if(i==1 || i==4){decal = 20;}else{decal = 60;}
				y = y + Math.sin((angle+decal)*Math.PI/180)*aug;
				//console.log(y);
			}
			if( (i>=78 && i<=81) ){
				if(i==78 || i==81){decal = 100;}else{decal = 140;}
				y = y + Math.sin((angle+decal)*Math.PI/180)*aug;
				//console.log(y);
			}
			//head
			if(i>=6 && i<=76){
				x = x + Math.cos(angle*Math.PI/180)*augl;
			}
			//feet
			if(i>=98 && i<=104){
				y = y + Math.sin(angle*(5)*Math.PI/180)*augf;
			}
		}
		
		if(i==0){
			ctx.moveTo(x,y);	
		}else{
			ctx.lineTo(x,y);
			}

	}

	ctx.closePath();
	//choosing a color and aplying it to the path
	ctx.fillStyle = 'black';
	ctx.fill();
	ctx.strokeStyle = 'black';
	ctx.stroke();
	
	angle+=5;

	requestAnimationFrame(draw);
}

draw();


function mOnClick(e){
	activate = !activate;
	angle = 0;
}
