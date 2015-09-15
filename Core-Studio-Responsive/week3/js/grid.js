var canvas = document.getElementById("canvas");
canvas.width = window.innerWidth;
canvas.height= window.innerHeight;
var ctx = canvas.getContext('2d');

var edgeSize;
var myNumber;
var decoder;
var speed;
var counter;
var d;

function setup(){
	edgeSize = 20;
	myNumber = "1234567890";
	decoder = new Decoder();
	speed = 0;
	counter = 0;
	ctx.strokeStyle = 'black';
	ctx.fillStyle = 'black';
	draw();
}

function draw(){
	
	d = new Date();

	// if(d.getSeconds()<10){myNumber ='0'+d.getSeconds()}else{myNumber =d.getSeconds();}
	// (d.getSeconds()<10)?'0'+d.getSeconds():d.getSeconds()
	// (d.getMinutes()<10)?'0'+d.getMinutes():d.getMinutes()
	// (d.getHours()<10)?'0'+d.getHours():d.getHours()

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
				var gap = (myLine.length+1)*edgeSize;
				if(myBinaryValue==1){
					ctx.fillRect(i*edgeSize + (k*gap) + (counter*speed) +2,j*edgeSize+2,edgeSize-4,edgeSize-4);
					ctx.beginPath() ;
					ctx.rect(i*edgeSize + (k*gap) + (counter*speed),j*edgeSize,edgeSize,edgeSize);
					ctx.stroke();
					ctx.closePath();
				}
			}
		}
	}

	requestAnimationFrame(draw);
	console.log("I'm drawing");
	counter++;
}


setup();