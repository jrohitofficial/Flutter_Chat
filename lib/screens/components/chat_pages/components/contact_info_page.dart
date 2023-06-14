import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:one_chat/screens/chat_page.dart';
import 'package:one_chat/screens/components/chat_pages/components/view_profile_picture.dart';
import 'package:socket_client/socket_client.dart';

class ContactInfoPageScreen extends StatefulWidget {
  final MessageDetails conversationInfo;

  const ContactInfoPageScreen({
    Key? key,
    required this.conversationInfo,
  }) : super(key: key);

  @override
  State<ContactInfoPageScreen> createState() => _ContactInfoPageScreenState();
}

class _ContactInfoPageScreenState extends State<ContactInfoPageScreen> {
  int index_0 = 0;
  int index_1 = 0;
  bool muteIndex = false;
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
      body: Stack(
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewProfilePicScreen(
                                  conversationInfo: widget.conversationInfo)),
                        );
                      },
                      child: ClipOval(
                        child: Image.asset(
                          widget.conversationInfo.sender.image,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.conversationInfo.sender.name,
                    style: TextStyle(
                      // color: kPrimaryColor,
                      fontSize: 25,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Online",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            index_1 == 0
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        index_1 = 1;
                                      });
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/icons/star.svg',
                                      color: Colors.yellow,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        index_1 = 0;
                                      });
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/icons/star.4.svg',
                                      color: Colors.yellow,
                                    ),
                                  ),

                            // Spacer(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Star',
                              style: TextStyle(
                                fontSize: 12,
                                // color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            index_0 == 0
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        index_0 = 1;
                                      });
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/icons/heart.2.svg',
                                      color: Colors.red,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        index_0 = 0;
                                      });
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/icons/heart.5.svg',
                                      color: Colors.red,
                                    ),
                                  ),
                            // Spacer(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Like',
                              style: TextStyle(
                                fontSize: 12,
                                // color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Mute Notifications',
                            style: TextStyle(
                              fontSize: 15,
                              // color: kPrimaryColor,
                            ),
                          ),
                        ),
                        muteNotificationButton(),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Friends in common',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '42',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/icons/3-user.1.svg',
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(bottom: 5.0),
                            // width: double.maxFinite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Block ${widget.conversationInfo.sender.name}',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/icons/hide.svg',
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            // width: double.maxFinite,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Theme.of(context)
                                      .iconTheme
                                      .color!
                                      .withOpacity(0.4),
                                ),
                                bottom: BorderSide(
                                  color: Theme.of(context)
                                      .iconTheme
                                      .color!
                                      .withOpacity(0.4),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Report ${widget.conversationInfo.sender.name}',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/icons/shield-fail.4.svg',
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(top: 5.0),
                            // width: double.maxFinite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Diconnect from ${widget.conversationInfo.sender.name}',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/icons/delete.3.svg',
                                  color: Colors.red,
                                ),
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
          ),
        ],
      ),
    );
  }

  Widget muteNotificationButton() {
    return GFToggle(
      value: muteIndex,
      onChanged: (value) => setState(() {
        muteIndex = true;
      }),
      enabledTrackColor: Colors.blue, // Theme.of(context).iconTheme.color,
      enabledThumbColor: Colors.white,
      type: GFToggleType.ios,
    );
  }
}
