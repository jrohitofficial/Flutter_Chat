import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_chat/functions.dart';
import 'package:one_chat/main.dart';
import 'package:one_chat/screens/account_page.dart';
import 'package:one_chat/screens/components/account_pages/account_settings_page/Notifications_page.dart';
import 'package:one_chat/screens/components/account_pages/account_settings_page/chat_folder_page.dart';
import 'package:one_chat/screens/components/account_pages/account_settings_page/chat_settings_page.dart';
import 'package:one_chat/screens/components/account_pages/account_settings_page/fingerprint_page.dart';
import 'package:one_chat/screens/components/account_pages/account_settings_page/language_page.dart';
import 'package:one_chat/screens/components/account_pages/account_settings_page/password_page.dart';
import 'package:one_chat/screens/components/account_pages/account_settings_page/storage_page.dart';
import 'package:one_chat/screens/components/account_pages/account_settings_page/theme_page.dart';
import 'package:one_chat/screens/components/account_pages/account_settings_page/universal_page.dart';

class SettingsScreen extends StatelessWidget {
  final screens = [
    PatternScreen(title: 'FingerPrint'),
    PasswordScreen(title: 'Password'),
    ThemeScreen(title: 'Appearence'),
    UniversalScreen(title: 'Universal'),
    NotificationsScreen(title: 'Notifications & Sounds'),
    ChatSettingsScreen(title: 'Chat Settings'),
    StorageScreen(title: 'Data & Storage'),
    ChatFolderScreen(title: 'Chat Folders'),
    LanguageScreen(title: 'Languages'),
  ];
  final List<AccountSetting> accountItem_1 = [
    AccountSetting(
      title: 'FingerPrint',
      icon: 'assets/icons/scan.6.svg',
      color: Colors.blueAccent,
      pageRoute: 0,
    ),
    AccountSetting(
      title: 'Password',
      icon: 'assets/icons/lock.6.svg',
      color: Colors.blueAccent,
      pageRoute: 1,
    ),
  ];
  final List<AccountSetting> accountItem_2 = [
    AccountSetting(
      title: 'Themes',
      icon: 'assets/icons/discount.5.svg',
      color: Colors.green,
      pageRoute: 2,
    ),
    AccountSetting(
      title: 'Univesal',
      icon: 'assets/icons/chart.4.svg',
      color: Colors.green,
      pageRoute: 3,
    ),
    AccountSetting(
      title: 'Notifications and Sounds',
      icon: 'assets/icons/notification.2.svg',
      color: Colors.green,
      pageRoute: 4,
    ),
    AccountSetting(
      title: 'Chat Settings',
      icon: 'assets/icons/chat.6.svg',
      color: Colors.green,
      pageRoute: 5,
    ),
  ];
  final List<AccountSetting> accountItem_3 = [
    AccountSetting(
      title: 'Data and Storage',
      icon: 'assets/icons/graph.1.svg',
      color: Color.fromRGBO(244, 67, 54, 1),
      pageRoute: 6,
    ),
    AccountSetting(
      title: 'Chat Folders',
      icon: 'assets/icons/folder.4.svg',
      color: Colors.red,
      pageRoute: 7,
    ),
  ];
  final List<AccountSetting> accountItem_4 = [
    AccountSetting(
      title: 'Language',
      icon: 'assets/icons/language.svg',
      color: Colors.yellow,
      pageRoute: 8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 25,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Security',
                    style: TextStyle(
                      // color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      // height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          for (final element in accountItem_1)
                            subSettingsElement(context, element, accountItem_1),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Application',
                    style: TextStyle(
                      // color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      // height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          for (final element in accountItem_2)
                            subSettingsElement(context, element, accountItem_2),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Storage',
                    style: TextStyle(
                      // color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      // height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          for (final element in accountItem_3)
                            subSettingsElement(context, element, accountItem_3),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Language',
                    style: TextStyle(
                      // color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      // height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          for (final element in accountItem_4)
                            subSettingsElement(context, element, accountItem_4),
                        ],
                      ),
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

  Widget subSettingsElement(BuildContext context, AccountSetting element,
      List<AccountSetting> accountItem) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => screens[element.pageRoute]),
        ),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            child: SvgPicture.asset(
              element.icon,
              color: element.color,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              // color: Colors.red,
              height: 50,
              decoration: element != accountItem.last
                  ? BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context)
                              .iconTheme
                              .color!
                              .withOpacity(0.4),
                        ),
                      ),
                    )
                  : BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    element.title,
                    style: TextStyle(
                      // color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: 'Comfortaa_regular',
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/arrow-right-2.4.svg',
                    height: 20,
                    width: 20,
                    color: Theme.of(context).iconTheme.color!.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
