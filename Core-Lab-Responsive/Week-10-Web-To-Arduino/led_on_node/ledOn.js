// first install node.js
// npm install serialport
// npm install request

var serialport = require('serialport');
var request = require('request');

var portName = '/dev/tty.usbmodem411';
var sp = new serialport.SerialPort(portName, {
    baudRate: 9600,
    dataBits: 8,
    parity: 'none',
    stopBits: 1,
    flowControl: false,
    parser: serialport.parsers.readline("\r\n")
});

sp.on('open', function() {
    console.log("open");
});

setInterval(function (){
	
	request.get('http://amt.dtparis.com/responsive/chris/led/led.txt', function (error, response, body) {
     	if (!error && response.statusCode == 200) {
            var csv = body;
         	console.log(csv);
         	if(body == 0){
				sp.write("L");
        	}else{
        		sp.write("H");
        	}
    	}
	 });

}, 50); 