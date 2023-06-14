import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_chat/functions.dart';
import 'package:one_chat/main.dart';

class UpdateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Updates',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 25,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/1_Cloud_logo.svg',
              color: Theme.of(context).iconTheme.color,
              height: 75,
              width: 75,
            ),
            Text(
              'No updates!!!',
              style: TextStyle(
                fontFamily: 'Comfortaa_bold',
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
