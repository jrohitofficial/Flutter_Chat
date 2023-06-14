import 'dart:io';
import 'dart:typed_data';

late Socket socket;

class ChatClient {
  final Socket socket;
  final String address;
  final int port;
  late String name;
  late String image;

  ChatClient({
    required this.socket,
    required this.address,
    required this.port,
    required this.name,
    required this.image,
  });
}

class MessageDetails {
  final ChatClient sender;
  final ChatClient receiver;
  final List<MessageInfos> message;

  const MessageDetails({
    required this.sender,
    required this.receiver,
    required this.message,
  });
}

class MessageInfos {
  final String text;
  final DateTime date;
  final bool isSentByMe;
  const MessageInfos({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}

List<MessageDetails> oneChatMessages = [];
List<String?> userInfos = [];

connectionTask() async {
  try {
    socket = await Socket.connect('192.168.43.254', 4698);

    // return socket;
  } catch (e) {
    print('Lets Chat');
    connectionTask();
  }
}

connectionTask1() async {
  try {
    Socket.connect("192.168.43.254", 4698).then((Socket sock) {
      socket = sock;
      // onConnection(sock);
      // final String test = 'It Works';
    }).catchError((e) {
      print(
          ":::::::::::::\nUnable to connect to a server with the given port\n::::::::::::::\n$e\n:::::::::::::\n");
      // exit(1);
      connectionTask1();
    });

    return socket;

    //Connect standard in to the socket

    // stdin.listen((data) async {
    //   await sendMessage(socket, data);
    // });
  } catch (e) {
    print(
        ":::::::::::::\nAn error occurred when executing the client socket application\nHere's the error\n::::::::::::::\n$e\n:::::::::::::");
  }
}

void onConnection(Socket socket) {
  // socket.write("Joachim||_one_chat");

  socket.listen(
    // handle data from the server
    dataHandler,
    onError: errorHandler,
    onDone: () => doneHandler(socket),
    cancelOnError: false,
  );
}

void dataHandler(data) {
  // print(String.fromCharCodes(data).trim());
  // handle data from the server

  (Uint8List data) async {
    // if (List.from(data) is List<String>) {
    final message = String.fromCharCodes(data);
    if (message.contains('|')) {
      final int i = message.indexOf('|');

      final sender = message.substring(message.length - i);
      final sms = message.substring(0, i);

      final info = MessageInfos(
        text: sms,
        date: DateTime.now(),
        isSentByMe: false,
      );

      final int index =
          oneChatMessages.indexWhere((item) => item.sender.name == sender);

      oneChatMessages[index].message.add(info);
    } else {
      userInfos.add(message);
    }
  };
}

void errorHandler(error, StackTrace trace) {
  print(
      "Coucou !!!!!\n::::::::::::::::Here is the error::::::::::::\n$error\n:::::::::::::");
}

void doneHandler(Socket socket) {
  print('Good job Server!!!');
  // socket.destroy();
  connectionTask();
  // exit(0);
}

Future<void> sendMessage(String data, List receiver) async {
  // stdin.readLineSync();
  socket.write('$data||$receiver\n');
  await Future.delayed(Duration(milliseconds: 500));
}
