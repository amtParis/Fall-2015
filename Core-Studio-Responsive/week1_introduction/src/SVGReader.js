var canvas = document.getElementById("canvas");
canvas.width = window.innerWidth;
canvas.height= window.innerHeight;
var ctx = canvas.getContext('2d');

// string of coordinates
// all coordinates are separated with a blank space
// x and y are separated by a coma
var SVGPoints = "422.1,472.5 473.7,420.9 422.1,369.4 422.1,296.4 349.2,296.4 297.6,244.9 246.1,296.4 173.1,296.4 173.1,369.4 121.6,420.9 173.1,472.5 173.1,545.4 246.1,545.4 297.6,597 349.2,545.4 422.1,545.4";

//split the string
//will create an array of coordinates
var XYcoord = SVGPoints.split(" ");


//drawing path 
ctx.beginPath();
//looping through all coordinates
for(var i=0;i<XYcoord.length;i++){
	//split each coordinate
	//will create an array of numbers
	var XY = XYcoord[i].split(",");
	//get each x and y
	var x = XY[0];
	var y = XY[1];

	//for the first element (first round in the loop)
	if(i==0){
		//we move the pen on the first coordinate
		ctx.moveTo(x, y);
	//for all other elements, we draw a line
	}else{

		ctx.lineTo(x,y);

	}

}
//once the loop has ended, we close the path
ctx.closePath();
//setting a color
ctx.strokeStyle = 'black';
//applying the color to the stroke of our shape
ctx.stroke();