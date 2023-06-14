import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_chat/constant.dart';
import 'package:one_chat/welcome_screens/auth/security_auth_page.dart';
import 'package:one_chat/welcome_screens/auth/sign_in_page.dart';
import 'package:one_chat/welcome_screens/start_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  final List<String>? userInfo;
  const LoadingScreen({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // startTime();
    start();
  }

  start() async {
    bool? firstTime = UserSimplePreferences.getFirstTime();
    bool? passwordSecurity = UserSimplePreferences.getPasswordSecurity();
    if (firstTime != null && !firstTime) {
      if (passwordSecurity != null && !passwordSecurity) {
        startTime2();
      } else {
        startTime();
      }
    } else {
      startTime1();
    }
  }

  startTime() async {
    var duration = new Duration(seconds: 5);
    return new Timer(duration, route);
  }

  startTime1() async {
    var duration = new Duration(seconds: 5);
    return new Timer(duration, route1);
  }

  startTime2() async {
    var duration = new Duration(seconds: 5);
    return new Timer(duration, route2);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(
          userInfo: widget.userInfo,
        ),
      ),
    );
  }

  route1() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(
          userInfo: widget.userInfo,
        ),
      ),
    );
  }

  route2() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SecurityAuthScreen(
          userInfo: widget.userInfo,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 228, 228, 228),
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -MediaQuery.of(context).size.width * 0.8,
          bottom: 0,
          child: SvgPicture.asset(
            'assets/images/one_chat_logo.svg',
            color: Colors.white.withOpacity(0.4),
            // colorBlendMode: BlendMode.modulate,
            // width: MediaQuery.of(context).size.width * 3,
            height: MediaQuery.of(context).size.height * 0.6,
          ),
        ),
        SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                SvgPicture.asset(
                  'assets/images/one_chat_logo.svg',
                  height: 75,
                  width: 75,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'One Chat',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Comfortaa_bold',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Work Social Network',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Comfortaa_bold',
                    // color: Colors.black45,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
