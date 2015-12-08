/*
	CREATE HTML ELEMENTS
*/

	var images = [
		"media/Wall1.jpg",
			"media/Wall2.jpg",
				"media/Wall1.jpg",
					"media/Wall2.jpg",
					"media/floor.jpg",


	]

	var all3DLayers = [];


for(var i=0;i<images.length;i++){
	var element = document.createElement( 'div' );
	element.className = 'element';
	var img = document.createElement('img');
	img.src = images[i];
	img.width = 1240;
	img.height = 1240;
	element.appendChild( img );
  var object = new THREE.CSS3DObject( element );
	all3DLayers.push(object);
}

virtualRoom = new VRRoom(all3DLayers);
