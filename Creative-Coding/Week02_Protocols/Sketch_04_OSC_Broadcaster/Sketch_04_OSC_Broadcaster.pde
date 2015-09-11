import oscP5.*;
import netP5.*;

OscP5 oscP5;

// List to store the list of connected clients
// This list is used for broadcasting messages
NetAddressList netAddressList = new NetAddressList();

/* listeningPort is the port the server is listening for incoming messages */
int listeningPort = 32000;

/* the broadcast port is the port the clients should listen for incoming messages from the server*/
int broadcastPort = 12000;

String connectPattern = "/server/connect";
String disconnectPattern = "/server/disconnect";


void setup() {
  size(300, 600);
  oscP5 = new OscP5(this, listeningPort);
  frameRate(25);
}

void draw() {
  background(0);

  // Display the number of clients connected
  text(netAddressList.list().size() + " client(s) connected", 10, 30);

  // Display the list of IP addressses / Listening port of the clients
  for (int i=0; i<netAddressList.list().size(); i++) {
    text(netAddressList.get(i).address()+ " / "+netAddressList.get(i).port(), 10, i*30 + 60);
  }
}

void oscEvent(OscMessage message) {
  /* check if the address pattern fits any of our patterns */
  if (message.checkAddrPattern(connectPattern)) {
    connect(message.netAddress().address(), broadcastPort);
  } else if (message.checkAddrPattern(disconnectPattern)) {
    disconnect(message.netAddress().address(), broadcastPort);
  }
  /**
   * if pattern matching was not successful, then broadcast the incoming
   * message to all addresses in the netAddresList. 
   */
  else {
    oscP5.send(message, netAddressList);
  }
}


private void connect(String ipAddress, int port) {
  if (!netAddressList.contains(ipAddress, port)) {
    netAddressList.add(new NetAddress(ipAddress, port));
    println("### adding "+ipAddress+" "+ port + "to the list.");
  } else {
    println("### "+ipAddress+" is already connected.");
  }
  println("### currently there are "+netAddressList.list().size()+" remote locations connected.");
}



private void disconnect(String ipAddress, int port) {
  if (netAddressList.contains(ipAddress, port)) {
    netAddressList.remove(ipAddress, port);
    println("### removing "+ipAddress+" " + port + " from the list.");
  } else {
    println("### "+ipAddress+" is not connected.");
  }
  println("### currently there are "+netAddressList.list().size());
}