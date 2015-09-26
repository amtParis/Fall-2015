var canvas = document.getElementById("canvas");
canvas.width = window.innerWidth;
canvas.height= window.innerHeight;
var ctx = canvas.getContext('2d');

var edgeSizeX;
var edgeSizeY;
var myNumber;
var decoder;
var speed;
var counter;
var d;
var img;
var topPosition,leftposition;

function setup(){
	edgeSizeX = 5 + Math.random()*30;
	edgeSizeY = 5 + Math.random()*50;
	myNumber = "1234567890";
	decoder = new Decoder();
	speed = 0;
	counter = 0;
	ctx.strokeStyle = 'red';
	ctx.fillStyle = 'red';


	// we load any number to get its structure (how many lines, how many rows). We choose 0 randomly
	var dummy = decoder.getBinary("0");
	var howManyLines = dummy.length;
	var howManyRows =  dummy[0].length;
	//we set 2 positions to the middle of the screen
	//reduce by the half of the height and the width
	topPosition = window.innerHeight/2 - (edgeSizeY*howManyLines)/2;
	leftPosition= window.innerWidth/2 - (edgeSizeX*(howManyRows+1)*8)/2;
	
	// we load an image for the demo
	img = new Image();
	img.src = "data/shape.png";
	img.onload = function(){
		draw();
	}
}

function draw(){
	
	d = new Date();

	myNumber = ((d.getHours()<10)?'0'+d.getHours():d.getHours()) +":"+ ((d.getMinutes()<10)?'0'+d.getMinutes():d.getMinutes()) +":"+((d.getSeconds()<10)?'0'+d.getSeconds():d.getSeconds());

	ctx.clearRect(0,0,canvas.width,canvas.height);


	var splittedNumber = myNumber.split("");

	for(var k=0;k<splittedNumber.length;k++){
		var number = splittedNumber[k];
		var myBinary = decoder.getBinary(number);
		for(var j=0;j<myBinary.length;j+=1){
			var myLine = myBinary[j];
			for(var i=0;i<myLine.length;i+=1){
				var myBinaryValue = myLine[i];
				var gap = (myLine.length+1)*edgeSizeX;
				if(myBinaryValue==1){
					
					
					// simple square example
					// the important thing here is to locate the value of x and y
					// actually it's : 
					// x = i*edgeSizeX  + (k*gap) + (counter*speed) +2 + leftPosition
					// y = j*edgeSizeY+2 +topPosition
					ctx.fillRect(i*edgeSizeX  + (k*gap) + (counter*speed) +2 + leftPosition,j*edgeSizeY+2 +topPosition,edgeSizeX-4,edgeSizeY-4);
					ctx.beginPath() ;
					ctx.rect(i*edgeSizeX  + (k*gap) + (counter*speed)+leftPosition,j*edgeSizeY + topPosition,edgeSizeX,edgeSizeY);
					ctx.stroke();
					ctx.closePath();
				
					// simple image example
					//ctx.drawImage(img,i*edgeSizeX + (k*gap) + (counter*speed)+leftPosition,j*edgeSizeY +topPosition);
				}
			}
		}
	}

	requestAnimationFrame(draw);
	console.log("I'm drawing");
	counter++;
}


setup();