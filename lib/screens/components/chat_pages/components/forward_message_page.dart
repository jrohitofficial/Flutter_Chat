import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForwardMessageScreen extends StatelessWidget {
  final List statusInfo = [
    ContactsInfo(
      image: 'assets/images/1.png',
      username: '@Ulrich',
      time: 'Online',
    ),
    ContactsInfo(
      image: 'assets/images/6.png',
      username: '@Youmix',
      time: 'Online',
    ),
    ContactsInfo(
      image: 'assets/images/girl_studying_with_music.png',
      username: '@Julie',
      time: 'Online',
    ),
    ContactsInfo(
      image: 'assets/images/4.png',
      username: '@Nancy',
      time: 'Online',
    ),
    ContactsInfo(
      image: 'assets/images/2.png',
      username: '@Johannes',
      time: 'Online',
    ),
    ContactsInfo(
      image: 'assets/images/5.png',
      username: '@Bro',
      time: 'Online',
    ),
    ContactsInfo(
      image: 'assets/images/3.png',
      username: '@Manou',
      time: 'Online',
    ),
    ContactsInfo(
      image: 'assets/images/7.png',
      username: '@Julienne',
      time: 'Online',
    ),
    ContactsInfo(
      image: 'assets/images/8.png',
      username: '@Junior',
      time: 'Online',
    ),
    ContactsInfo(
      image: 'assets/images/10.png',
      username: '@Anne',
      time: 'Online',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: SvgPicture.asset(
            'assets/icons/arrow-left-2.2.svg',
            color: Theme.of(context).iconTheme.color!,
          ),
        ),
        title: Text(
          'Forward to...',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 16,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var item in statusInfo)
              statusBuilder(context, screenWidth, item),
          ],
        ),
      ),
    );
  }

  Widget statusBuilder(
    BuildContext context,
    double screenWidth,
    @required ContactsInfo item,
  ) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                height: (screenWidth / 100) * 15,
                // width: (screenWidth / 100) * 65,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Spacer(),
                    Text(
                      item.username,
                      style: TextStyle(
                        // color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Spacer(),
                    Text(
                      item.time,
                      style: TextStyle(
                          // color: kPrimaryColor,
                          ),
                    ),
                    // Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactsInfo {
  final String image, username, time;

  const ContactsInfo({
    Key? key,
    required this.image,
    required this.username,
    required this.time,
  });
}
