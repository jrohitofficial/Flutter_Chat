import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_chat/constant.dart';
import 'package:one_chat/functions.dart';
import 'package:one_chat/main.dart';
import 'package:one_chat/screens/account_page.dart';
import 'package:one_chat/screens/chat_page.dart';
import 'package:one_chat/screens/components/account_pages/about_page.dart';
import 'package:one_chat/screens/components/account_pages/settings_page.dart';
import 'package:one_chat/screens/components/scan_page.dart';
import 'package:one_chat/screens/search_page.dart';
import 'package:one_chat/screens/storie_page.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class MyHomePage extends StatefulWidget {
  final List<String>? userInfo;
  const MyHomePage({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  double appBarHeightSize = 0;

  final inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screens = [
      StorieScreen(),
      StorieScreen(),
      SearchScreen(),
      AccountScreen(
        userInfo: widget.userInfo,
      ),
    ];

    final screenName = [
      'One Chat',
      'Status',
      'Search',
      'Account',
    ];
    List<List> menuItemList = [
      [
        'assets/icons/scan.svg',
        'Scan to connect',
        ScanScreen(
          appBarHeightSize: appBarHeightSize,
        ),
      ],
      [
        'assets/icons/setting.2.svg',
        'Settings',
        SettingsScreen(),
      ],
      [
        'assets/icons/info-square.4.svg',
        'About',
        AboutScreen(),
      ],
    ];
    AppBar appBar = AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        screenName[index],
        style: TextStyle(
          color: Theme.of(context).iconTheme.color,
          fontSize: 25,
        ),
      ),
      actions: [
        index != 2
            ? IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/search.svg',
                  color: Theme.of(context).iconTheme.color,
                ),
              )
            : Container(),
        IconButton(
          onPressed: () {
            UsualFunctions.openDialog(context, menuItemList, appBarHeightSize);
          },
          icon: SvgPicture.asset(
            'assets/icons/more-circle.1.svg',
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: index != 3
          ? Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context).themeMode ==
                        ThemeMode.dark
                    ? Theme.of(context).primaryColor
                    // ? Color.fromRGBO(5, 35, 61, 1)
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: index == 0
                  ? ChatScreen(
                      appBarHeightSize: appBarHeightSize,
                    )
                  : screens[index],
            )
          : screens[index],
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // color: kSecondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  appBarHeightSize = appBar.preferredSize.height;
                  index = 0;
                });
              },
              icon: Center(
                child: Column(
                  children: [
                    index == 0
                        ? badges.Badge(
                            animationType: BadgeAnimationType.scale,
                            badgeColor: Colors.blueAccent,
                            // position: BadgePosition.center(),
                            badgeContent: Text(
                              '99+',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/chat.5.svg',
                              color: Theme.of(context).iconTheme.color,
                            ),
                          )
                        : badges.Badge(
                            animationType: BadgeAnimationType.scale,
                            badgeColor: Colors.blueAccent,
                            // position: BadgePosition.center(),
                            badgeContent: Text(
                              '99+',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/chat.6.svg',
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                    Spacer(),
                    Text(
                      'Chats',
                      style: TextStyle(
                        fontSize: 7,
                        // color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  appBarHeightSize = appBar.preferredSize.height;
                  index = 1;
                });
              },
              icon: Column(
                children: [
                  index == 1
                      ? badges.Badge(
                          animationType: BadgeAnimationType.scale,
                          badgeColor: Colors.blueAccent,
                          // position: BadgePosition.center(),
                          badgeContent: Text(
                            '9',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/plus.3.svg',
                            color: Theme.of(context).iconTheme.color,
                          ),
                        )
                      : badges.Badge(
                          animationType: BadgeAnimationType.scale,
                          badgeColor: Colors.blueAccent,
                          // position: BadgePosition.center(),
                          badgeContent: Text(
                            '9',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/plus.1.svg',
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                  Spacer(),
                  Text(
                    'Status',
                    style: TextStyle(
                      fontSize: 7,
                      // color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  appBarHeightSize = appBar.preferredSize.height;
                  index = 2;
                });
              },
              icon: Column(
                children: [
                  index == 2
                      ? SvgPicture.asset(
                          'assets/icons/search.6.svg',
                          color: Theme.of(context).iconTheme.color,
                        )
                      : SvgPicture.asset(
                          'assets/icons/search.svg',
                          color: Theme.of(context).iconTheme.color,
                        ),
                  Spacer(),
                  Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 7,
                      // color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  appBarHeightSize = appBar.preferredSize.height;
                  index = 3;
                });
              },
              icon: Column(
                children: [
                  index == 3
                      ? SvgPicture.asset(
                          'assets/icons/profile.3.svg',
                          color: Theme.of(context).iconTheme.color,
                        )
                      : SvgPicture.asset(
                          'assets/icons/profile.4.svg',
                          color: Theme.of(context).iconTheme.color,
                        ),
                  Spacer(),
                  Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 7,
                      // color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
