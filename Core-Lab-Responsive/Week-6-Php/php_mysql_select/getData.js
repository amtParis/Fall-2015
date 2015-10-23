
// when submit is pressed on our form, attempt to save data
 $("form").submit(function(e) {
 	e.preventDefault();
 	console.log("Retrieve data.");
 	findMyData();
 });


// function to send data to php script and get response
function findMyData(){
	
	var request;	// ajax request
	var dataToSend = "myName=" + $("#name").val();

	request = $.ajax({
        url: "getName.php",
        type: "post",
        data: dataToSend
    });

	// called on success
    request.done(function (response, textStatus, jqXHR){
        // Log a message to the console
        console.log("Hooray, it worked! " + response);
        
        // show  json data
        $("#response").text("Results:");
        $("#response").append("<br>");

        // loop through and insert formatted results
        var jsonData = JSON.parse(response);
        for( var i = 0; i < jsonData.length; i++){
            $("#response").append(jsonData[i].username);
            $("#response").append(", ");
            $("#response").append(jsonData[i].city);
            $("#response").append(", ");
            $("#response").append(jsonData[i].date);
            $("#response").append("<br>");
        }
        
        
    });

     // called on failure
    request.fail(function (jqXHR, textStatus, errorThrown){
        // Log the error to the console
         console.error(
             "The following error occurred: "+
             textStatus, errorThrown
         );
         $("#response").text("Request failed.");

    });
}


