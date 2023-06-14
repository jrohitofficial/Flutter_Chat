import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socket_client/socket_client.dart';

class ViewProfilePicScreen extends StatelessWidget {
  final MessageDetails conversationInfo;

  const ViewProfilePicScreen({
    Key? key,
    required this.conversationInfo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: SvgPicture.asset(
            'assets/icons/arrow-left-2.2.svg',
            color: Theme.of(context).iconTheme.color!,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: double.maxFinite,
          height: 400,
          child: Image.asset(
            conversationInfo.sender.image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
