import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_chat/main.dart';
import 'package:one_chat/screens/components/account_pages/about_page.dart';
import 'package:one_chat/screens/components/account_pages/help_page.dart';
import 'package:one_chat/screens/components/account_pages/my_data_page.dart';
import 'package:one_chat/screens/components/account_pages/my_profile_page.dart';
import 'package:one_chat/screens/components/account_pages/policy_page.dart';
import 'package:one_chat/screens/components/account_pages/settings_page.dart';
import 'package:one_chat/screens/components/account_pages/updates_pages.dart';

class AccountScreen extends StatefulWidget {
  final List<String>? userInfo;
  const AccountScreen({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final screens = [
    MyDataScreen(),
    MyProfileScreen(username: '@Rohit Jha'),
    SettingsScreen(),
    PolicyScreen(),
    HelpScreen(),
    UpdateScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final List<AccountSetting> accountItem_1 = [
      // [
      //   'assets/icons/star.4.svg',
      //   'My Achievements',
      //   Colors.yellow,
      // ],
      AccountSetting(
        title: 'My Data',
        icon: 'assets/icons/activity.2.svg',
        color: Colors.green,
        pageRoute: 0,
      ),

      // [
      //   'assets/icons/heart.5.svg',
      //   'My Favorite',
      //   Colors.red,
      // ],
      AccountSetting(
        title: 'My Profile',
        icon: 'assets/icons/profile.3.svg',
        color: Colors.blueAccent,
        pageRoute: 1,
      ),
    ];
    final List<AccountSetting> accountItem_2 = [
      AccountSetting(
        title: 'Settings',
        icon: 'assets/icons/setting.6.svg',
        color: Colors.blueGrey,
        pageRoute: 2,
      ),
      AccountSetting(
        title: 'Privacy Management',
        icon: 'assets/icons/shield-done.4.svg',
        color: Colors.lightBlue,
        pageRoute: 3,
      ),
      AccountSetting(
        title: 'Help',
        icon: 'assets/icons/bookmark.5.svg',
        color: Colors.purple,
        pageRoute: 4,
      ),
      AccountSetting(
        title: 'Check for updates',
        icon: 'assets/icons/arrow-up-square.2.svg',
        color: Colors.green,
        pageRoute: 5,
      ),
      AccountSetting(
        title: 'About',
        icon: 'assets/icons/info-square.3.svg',
        color: Colors.blue,
        pageRoute: 6,
      ),
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipOval(
              child: Image.asset(
                'assets/images/girl_studying_with_music.png',
                fit: BoxFit.cover,
                height: 75,
                width: 75,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 20,
            ),
          ),
          Center(
            child: Text(
              widget.userInfo![0],
              style: TextStyle(
                // color: kPrimaryColor,
                fontSize: 25,
                fontFamily: 'Comfortaa_bold',
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'One Chat Data',
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
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        for (final element in accountItem_1)
                          settingsElement(context, element, accountItem_1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Others',
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
                          settingsElement(context, element, accountItem_2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget settingsElement(BuildContext context, AccountSetting element,
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

class AccountSetting {
  final String title, icon;
  final Color color;
  final int pageRoute;

  const AccountSetting({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.pageRoute,
  });
}
