var canvas = document.getElementById("canvas");
canvas.width = window.innerWidth;
canvas.height= window.innerHeight;
var ctx = canvas.getContext('2d');


var XSquareNbr = 500;
var YSquareNbr = 70;

var edgeSize = 20;


for(var j=0;j<YSquareNbr;j+=1){
	/*
	j=0
	j=1
	*/

	for(var i=0;i<XSquareNbr;i+=1){

		/*
		i=0
		i=1
		*/

		ctx.rect(i*edgeSize,j*edgeSize,edgeSize,edgeSize);


	}


}

ctx.strokeStyle = 'black';
ctx.stroke();