
var saveMe = false;
var rot = 0;

function setup() {
  
  // add SVG to create canvas
  var myCanvas = createCanvas(400, 400, SVG);
  myCanvas.parent("canvas");

}



function draw() {

  clear(); // need this so not every frame added to svg

  background(200);
  
  fill('#ED225D');
  rectMode(CENTER);
  
  push();
  translate(200,200);
  rotate(rot);
  rect(0, 0, 200, 200);
  pop();

  rot += .01;

  // save last
  if(saveMe){
    console.log("save");
    saveSVG();
    saveMe = false;
  }
}


function keyPressed(){
      console.log(key);

  if(key == 'S'){
    saveMe = true;    
  }

}


/* ---------- save from button */
$("#saveButton").click( function() {
  saveMe = true;
});



/* ---------- These are needed to override some functions in p5.js and p5-svg.js */

// send to php script to save in folder 
p5.prototype.downloadFile = function(href, fName, extension) {

  var dataToSend = "svg=" + href + "&folder=svg";
  var req = $.ajax({
      type: "post",
      url: "saveSvg.php",
      data: dataToSend
  });
  
  req.done(function (response, textStatus, jqXHR){
      console.log("Response: " + response);
      
      if(response == 1){
        $("#results").text("Saved!");
      }
  });
  
  req.fail(function (jqXHR, textStatus, errorThrown){
   console.error("Error: "+textStatus, errorThrown);
  });

}


// allows nesting inside parent element, don't need to change anything here
p5.Element.prototype.parent = function(p) {
  if (typeof p === 'string') {
    p = document.getElementById(p);
  } else if (p instanceof p5.Element) {
    p = p.elt;
  }
  p.appendChild(this.elt.wrapper);
  return this;
};
