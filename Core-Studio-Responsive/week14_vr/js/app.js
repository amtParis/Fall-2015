/*
	CREATE HTML ELEMENTS
*/
var table = [
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z"

];

var all3DLayers =[];

for ( var i = 0; i < table.length; i ++ ) {

	var element = document.createElement( 'div' );
	element.className = 'element';
	element.id = "name_"+i;
	//element.style.backgroundColor = 'rgba(0,127,127,' + ( Math.random() * 0.5 + 0.25 ) + ')';

	var symbol = document.createElement( 'div' );
	symbol.className = 'symbol';
	symbol.textContent = table[i];

	element.appendChild( symbol );

	var object = new THREE.CSS3DObject( element );

	all3DLayers.push(object);
}

virtualRoom = new VRRoom(all3DLayers);
