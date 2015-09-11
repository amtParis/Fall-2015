var canvas = document.getElementById("canvas");
canvas.width = window.innerWidth;
canvas.height= window.innerHeight;
var ctx = canvas.getContext('2d');


var XSquareNbr = 5;
var YSquareNbr = 7;

var edgeSize = 20;

var myNumber = "1934871239";

var splittedNumber = myNumber.split("");


var decoder = new Decoder();






for(var k=0;k<splittedNumber.length;k++){

	var number = splittedNumber[k];


	var myBinary = decoder.getBinary(number);


	for(var j=0;j<myBinary.length;j+=1){
		/*
		j=0
		j=1
		*/

		var myLine = myBinary[j];

		for(var i=0;i<myLine.length;i+=1){

			/*
			i=0
			i=1
			*/
			var myBinaryValue = myLine[i];

			var gap = (myLine.length+4)*edgeSize;

			if(myBinaryValue==1){
				ctx.rect(i*edgeSize + (k*gap),j*edgeSize,edgeSize,edgeSize);
			}


		}

	}

}

ctx.strokeStyle = 'black';
ctx.stroke();