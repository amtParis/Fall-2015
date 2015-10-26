// The statements in the setup() function 
// execute once when the program begins
function setup() {
	// createCanvas must be the first statement
  var myCanvas = createCanvas(720, 400);  
  myCanvas.parent('p5canvas');
  stroke(255);     // Set line drawing color to white
  frameRate(30);
}

// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
function draw() {
  stroke(0);
  background(255,0,0);
  ellipse(20,20,40,40);

} 

function saveMyFile(){
	var canvas = document.getElementsByTagName("canvas");
	var myCanvas = canvas[0];

	var dataURL = myCanvas.toDataURL();

	var dataToSend = "image=" + dataURL;

			var request = $.ajax({
   				url: "saveDataUrl.php",
   				type: "post",
   				data: dataToSend
			});

			request.done(function (response, textStatus, jqXHR){
				console.log("Hooray, it worked! " + response);
			});

			request.fail(function (jqXHR, textStatus, errorThrown){
				console.error( "There was an error " + textStatus, errorThrown);
			});
}