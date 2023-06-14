import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_chat/main.dart';

class StorieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final List statusInfo = [
      StatusInfo(
        image: 'assets/images/1.png',
        username: '@robertraj',
        time: '7:45 PM',
      ),
      StatusInfo(
        image: 'assets/images/6.png',
        username: '@kiranrana',
        time: '7:45 PM',
      ),
      StatusInfo(
        image: 'assets/images/girl_studying_with_music.png',
        username: '@roshani',
        time: '7:45 PM',
      ),
      StatusInfo(
        image: 'assets/images/4.png',
        username: '@Nancy',
        time: '7:45 PM',
      ),
      StatusInfo(
        image: 'assets/images/2.png',
        username: '@sabin',
        time: '7:45 PM',
      ),
      StatusInfo(
        image: 'assets/images/5.png',
        username: '@Bro',
        time: '7:45 PM',
      ),
      StatusInfo(
        image: 'assets/images/3.png',
        username: '@Manoj',
        time: '7:45 PM',
      ),
      StatusInfo(
        image: 'assets/images/7.png',
        username: '@rohit',
        time: '7:45 PM',
      ),
      StatusInfo(
        image: 'assets/images/8.png',
        username: '@Junior',
        time: '7:45 PM',
      ),
      StatusInfo(
        image: 'assets/images/10.png',
        username: '@rajkishor',
        time: '7:45 PM',
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          statusBuilder(
            context,
            screenWidth,
            StatusInfo(
              image: 'assets/images/girl_studying_with_music.png',
              username: 'My status',
              time: 'add status',
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 2.0,
              horizontal: 4.0,
            ),
            width: screenWidth,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(
              'Recent updates :',
              style: TextStyle(
                // color: kPrimaryColor,
                fontSize: 12,
                fontFamily: 'Comfortaa_bold',
              ),
            ),
          ),
          for (var item in statusInfo)
            statusBuilder(context, screenWidth, item),
        ],
      ),
    );
  }

  Widget statusBuilder(
    BuildContext context,
    double screenWidth,
    StatusInfo item,
  ) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 2.0,
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
                height: 50,
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
                      'at ' + item.time,
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

class StatusInfo {
  final String image, username, time;

  const StatusInfo({
    Key? key,
    required this.image,
    required this.username,
    required this.time,
  });
}
