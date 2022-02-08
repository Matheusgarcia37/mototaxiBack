//create server express with socket io on port 3000
import express from 'express';
import cors from 'cors';
import path from 'path';
//import socketIO from 'socket.io';

const app = express();

app.use(express.json());
app.use(cors());

app.set('port', process.env.PORT || 3000);

let http = require('http').Server(app);
let io = require('socket.io')(http, {
  cors: {
    origin: '*',
  }
});

app.get("/", (req: any, res: any) => {
  res.sendFile(path.resolve("./client/index.html"));
});

// whenever a user connects on port 3000 via
// a websocket, log that a user has connected
io.on("connection", function(socket: any) {
  console.log("a user connected");
  // whenever we receive a 'message' we log it out
  socket.on("message", function(message: any) {
    console.log(message);
  });
});

http.listen(3000, function() {
  console.log("🚀😊 listening on port 3000");
});