var http = require('http');
//Create a server object:
http.createServer(function (req, res) {
//write a response to the client
  res.write('You are connecting to Juthas Okari Server');
   //end the response
  res.end();
  //The server object listens on port 8080
}).listen(8080);