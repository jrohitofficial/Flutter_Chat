import 'package:flutter/material.dart';
import 'package:one_chat/main.dart';

class ChatSettingsScreen extends StatelessWidget {
  final String title;

  const ChatSettingsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
