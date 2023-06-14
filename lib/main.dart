// ************************************************************
// ************************************************************
// ***     Copyright 2022 One Chat. All rights reserved.    ***
// ***          by Jo@chim Ned@ouk@ (MacNight_nj).          ***
// ************************************************************
// ************************************************************

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_chat/constant.dart';
import 'package:one_chat/welcome_screens/loading_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:socket_client/socket_client.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await connectionTask();

  // onConnection(socket);

  // await Hive.initFlutter();
  await UserSimplePreferences.init();
  ThemeProvider.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String>? userInfo;

  @override
  void initState() {
    super.initState();
    // startConnection();
    userInfo = UserSimplePreferences.getUserInfo();
    appFolder();
  }

  // startConnection() async {
  //   await connectionTask();
  // }

  appFolder() async {
    final status = await Permission.storage.request();

    if (status == PermissionStatus.granted) {
      print('Allowed');

      // bool directoryExists = await Directory('/sdcard/One Chat/One_Chat Media').exists();
      if (!await Directory('/sdcard/One Chat').exists()) {
        await Directory('/sdcard/One Chat').create(recursive: true);
      }
      if (!await Directory('/sdcard/One Chat/One_Chat Media').exists()) {
        await Directory('/sdcard/One Chat/One_Chat Media')
            .create(recursive: true);
      }
      if (!await Directory('/sdcard/One Chat/One_Chat Media/One_Chat Images')
          .exists()) {
        await Directory('/sdcard/One Chat/One_Chat Media/One_Chat Images')
            .create(recursive: true);
      }
      if (!await Directory('/sdcard/One Chat/One_Chat Media/One_Chat Documents')
          .exists()) {
        await Directory('/sdcard/One Chat/One_Chat Media/One_Chat Documents')
            .create(recursive: true);
      }
      if (!await Directory('/sdcard/One Chat/One_Chat Media/One_Chat Videos')
          .exists()) {
        await Directory('/sdcard/One Chat/One_Chat Media/One_Chat Videos')
            .create(recursive: true);
      }
    } else {
      print('Denied');
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          // builder: (context, child) => StreamChat(
          //   client: widget.client,
          //   child: child,
          // ),
          title: 'One Chat',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: LoadingScreen(
            userInfo: userInfo,
          ),
        );
      },
    );
  }
}
