import '../lib/socket_client.dart';

import 'dart:io';

// void main() async {
//   WebSocket.connect('ws://127.0.0.1:8083/ws').then((socket) async {
//     socket.add('Hello, World!');
//     await for (var data in socket) {
//       print("from Server: $data");
//     }
//     stdin.listen((data) async {
//         socket.add(data);
//       });
//   });
// }



// int index = 8;

// void main() async {
//   try {
//     Socket.connect("localhost", 4698).then((Socket sock) {
//       socket = sock;
//       onConnection(sock);
//     }).catchError((e) {
//       print(
//           ":::::::::::::\nUnable to connect to a server with the given port\n::::::::::::::\n$e\n:::::::::::::\n");
//       // exit(1);
//       connectionTask();
//     });

//     // socket = await Socket.connect("localhost", 4698);

//     //Connect standard in to the socket

//     stdin.listen((data) async {
//       await sendMessage(socket, data);
//     });
//   } catch (e) {
//     print(
//         ":::::::::::::\nAn error occured when executing the client socket application\nHere's the error\n::::::::::::::\n$e\n:::::::::::::");
//   }
// }
