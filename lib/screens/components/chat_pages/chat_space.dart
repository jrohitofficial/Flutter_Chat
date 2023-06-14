import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:grouped_list/grouped_list.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:one_chat/constant.dart';
import 'package:one_chat/functions.dart';
import 'package:one_chat/screens/chat_page.dart';
import 'package:one_chat/screens/components/account_pages/about_page.dart';
import 'package:one_chat/screens/components/account_pages/settings_page.dart';
import 'package:one_chat/screens/components/chat_pages/components/contact_info_page.dart';
import 'package:one_chat/screens/components/chat_pages/components/forward_message_page.dart';
import 'package:provider/provider.dart';
import 'package:socket_client/socket_client.dart';

class ChatSpace extends StatefulWidget {
  final MessageDetails conversationInfo;
  final List message;
  final double appBarHeightSize;

  const ChatSpace({
    Key? key,
    required this.conversationInfo,
    required this.message,
    required this.appBarHeightSize,
  }) : super(key: key);

  @override
  State<ChatSpace> createState() => _ChatSpaceState();
}

class _ChatSpaceState extends State<ChatSpace> {
  int index = 0;

  File? image;
  final inputController = TextEditingController();
  List<List> menuItemList = [
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Colors.amberAccent,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //     onPressed: () => Navigator.maybePop(context),
      //     icon: SvgPicture.asset(
      //       'assets/icons/arrow-left-2.2.svg',
      //       color: Theme.of(context).iconTheme.color!,
      //     ),
      //   ),
      //   title: Row(
      //     children: [
      //       ClipOval(
      //         child: Image.asset(
      //           widget.conversationInfo.image,
      //           fit: BoxFit.cover,
      //           height: 40,
      //           width: 40,
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.symmetric(
      //           horizontal: 8.0,
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             Text(
      //               widget.conversationInfo.username,
      //               style: TextStyle(
      //                 // color: kPrimaryColor,
      //                 fontSize: 15,
      //                 fontFamily: 'Comfortaa_bold',
      //               ),
      //             ),
      //             SizedBox(
      //               height: 6,
      //             ),
      //             Text(
      //               "Online",
      //               style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: SvgPicture.asset(
      //         'assets/icons/search.svg',
      //         color: Theme.of(context).iconTheme.color!,
      //       ),
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: SvgPicture.asset(
      //         'assets/icons/more-circle.1.svg',
      //         color: Theme.of(context).iconTheme.color!,
      //       ),
      //     ),
      //   ],
      // ),

      // appBar: StreamChannelHeader(),
      body: Stack(
        children: [
          Positioned(
            right: -MediaQuery.of(context).size.width * 0.8,
            bottom: 0,
            child: SvgPicture.asset(
              'assets/images/one_chat_logo.svg',
              color: Colors.white.withOpacity(0.2),
              // colorBlendMode: BlendMode.modulate,
              // width: MediaQuery.of(context).size.width * 3,
              height: MediaQuery.of(context).size.height * 0.6,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.maybePop(context),
                      icon: SvgPicture.asset(
                        'assets/icons/arrow-left-2.2.svg',
                        color: Theme.of(context).iconTheme.color!,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => ContactInfoPageScreen(
                                conversationInfo: widget.conversationInfo)),
                          ),
                        );
                      },
                      onLongPress: () {},
                      child: FocusedMenuHolder(
                        menuItems: [
                          FocusedMenuItem(
                            title: Padding(
                              padding: EdgeInsets.only(
                                left: 18.0,
                                bottom: 10.0,
                              ),
                              child: Column(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      widget.conversationInfo.sender.image,
                                      fit: BoxFit.cover,
                                      height: 90,
                                      width: 90,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "Online",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    widget.conversationInfo.sender.name,
                                    style: TextStyle(
                                      // color: kPrimaryColor,
                                      fontSize: 20,
                                      fontFamily: 'Comfortaa_bold',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            onPressed: () {},
                          ),
                        ],
                        // duration: Duration(seconds: 0),
                        animateMenuItems: true,
                        openWithTap: false,
                        onPressed: () {},
                        menuWidth: 200,
                        menuOffset: MediaQuery.of(context).size.height * 0.30,
                        menuItemExtent: 200,
                        menuBoxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.grey.withOpacity(0.6),
                        ),
                        blurSize: 8,
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                widget.conversationInfo.sender.image,
                                fit: BoxFit.cover,
                                height: 40,
                                width: 40,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    widget.conversationInfo.sender.name,
                                    style: TextStyle(
                                      // color: kPrimaryColor,
                                      fontSize: 15,
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
                                        fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        UsualFunctions.openDialog(
                            context, menuItemList, widget.appBarHeightSize);
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/more-circle.1.svg',
                        color: Theme.of(context).iconTheme.color!,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GroupedListView<MessageInfos, DateTime>(
                    padding: EdgeInsets.all(8.0),
                    useStickyGroupSeparators: true,
                    floatingHeader: true,
                    elements: messages,
                    groupBy: (message) => DateTime(
                      message.date.year,
                      message.date.month,
                      message.date.day,
                    ),
                    groupHeaderBuilder: (MessageInfos message) => SizedBox(
                      height: 40,
                      child: Center(
                        child: Card(
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              DateFormat.yMMMd().format(message.date),
                              style: TextStyle(
                                // color: kPrimaryColor,
                                fontFamily: 'Comfortaa_light',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    itemBuilder: (context, MessageInfos message) => Align(
                      alignment: message.isSentByMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          message.isSentByMe ? 64.0 : 8.0,
                          4.0,
                          message.isSentByMe ? 8.0 : 64.0,
                          4.0,
                        ),
                        child: Column(
                          crossAxisAlignment: message.isSentByMe
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            FocusedMenuHolder(
                              menuItems: [
                                FocusedMenuItem(
                                  title: Text(
                                    'Reply',
                                  ),
                                  backgroundColor: Colors.transparent,
                                  onPressed: () => messageSnackbar(),
                                ),
                                FocusedMenuItem(
                                  title: Text(
                                    'Copy',
                                  ),
                                  backgroundColor: Colors.transparent,
                                  onPressed: () => messageSnackbar(),
                                ),
                                FocusedMenuItem(
                                  title: Text(
                                    'Forward',
                                  ),
                                  backgroundColor: Colors.transparent,
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          ForwardMessageScreen()),
                                    ),
                                  ),
                                ),
                                FocusedMenuItem(
                                  title: Text(
                                    'Report',
                                  ),
                                  backgroundColor: Colors.transparent,
                                  onPressed: () => messageSnackbar(),
                                ),
                                FocusedMenuItem(
                                  title: Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  onPressed: () {
                                    setState(() {
                                      messages.remove(message);
                                    });
                                  },
                                ),
                                FocusedMenuItem(
                                  title: Text(
                                    'Select',
                                  ),
                                  backgroundColor: Colors.transparent,
                                  onPressed: () => messageSnackbar(),
                                ),
                              ],
                              // duration: Duration(seconds: 0),
                              animateMenuItems: true,
                              openWithTap: true,
                              onPressed: () {},
                              menuWidth:
                                  MediaQuery.of(context).size.width * 0.5,
                              menuOffset: 8,
                              menuItemExtent: 40,
                              menuBoxDecoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.grey,
                              ),
                              blurSize: 1,
                              child: CustomPaint(
                                painter: CustomChatBubble(
                                  context: context,
                                  isOwn: message.isSentByMe,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                    horizontal: 5.0,
                                  ),
                                  child: Text(
                                    message.text,
                                    style: TextStyle(
                                      color: !message.isSentByMe
                                          ? Provider.of<ThemeProvider>(context)
                                                      .themeMode ==
                                                  ThemeMode.light
                                              ? Colors.white
                                              : Colors.black
                                          : Theme.of(context).iconTheme.color,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: message.isSentByMe
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat.Hm().format(message.date),
                                  style: TextStyle(
                                    fontSize: 9,
                                    // color: !message.isSentByMe
                                    //     ? Provider.of<ThemeProvider>(context)
                                    //                 .themeMode ==
                                    //             ThemeMode.light
                                    //         ? Colors.white
                                    //         : Colors.black
                                    //     : Theme.of(context).iconTheme.color,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                message.isSentByMe
                                    ? SvgPicture.asset(
                                        'assets/images/one_chat_logo.svg',
                                        height: 10,
                                      )
                                    : SvgPicture.asset(
                                        'assets/images/one_chat_logo.svg',
                                        height: 10,
                                        color: Colors.white,
                                      ),
                                message.isSentByMe
                                    ? Text(
                                        ' | ',
                                        style: TextStyle(
                                          fontSize: 9,
                                        ),
                                      )
                                    : Container(),
                                message.isSentByMe
                                    ? Text(
                                        'seen',
                                        style: TextStyle(
                                          fontSize: 9,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: ((context) => CupertinoActionSheet(
                                  actions: [
                                    CupertinoActionSheetAction(
                                      onPressed: () {},
                                      child: categoryItemBuilder(
                                          'assets/icons/heart.2.svg',
                                          'Documents'),
                                    ),
                                    CupertinoActionSheetAction(
                                      onPressed: () {},
                                      child: categoryItemBuilder(
                                          'assets/icons/heart.2.svg', 'Images'),
                                    ),
                                    CupertinoActionSheetAction(
                                      onPressed: () {},
                                      child: categoryItemBuilder(
                                          'assets/icons/heart.2.svg',
                                          'Gallery'),
                                    ),
                                    CupertinoActionSheetAction(
                                      onPressed: () {},
                                      child: categoryItemBuilder(
                                          'assets/icons/heart.2.svg', 'Videos'),
                                    ),
                                    CupertinoActionSheetAction(
                                      onPressed: () {},
                                      child: categoryItemBuilder(
                                          'assets/icons/heart.2.svg', 'Audio'),
                                    ),
                                  ],
                                )),
                          );
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/category.4.svg',
                          color: Theme.of(context).iconTheme.color!,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          height: 30,
                          child: TextField(
                            controller: inputController,
                            onChanged: (String value) {
                              setState(() {
                                if (value != '') {
                                  index = 1;
                                } else {
                                  index = 0;
                                }
                              });
                              print(value);
                            },
                            onSubmitted: (String text) {},
                            cursorWidth: 1.0,
                            cursorColor: Theme.of(context).iconTheme.color,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .iconTheme
                                      .color!
                                      .withOpacity(0.8),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(1000.0),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .iconTheme
                                      .color!
                                      .withOpacity(0.8),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(1000.0),
                                ),
                                // gapPadding: 2.0,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 2.0,
                                horizontal: 8.0,
                              ),
                              hintText: 'type a message',
                              hintStyle: TextStyle(
                                // color: kPrimaryColor,
                                fontFamily: 'Comfortaa_light',
                              ),
                            ),
                          ),
                        ),
                      ),
                      index == 0
                          ? IconButton(
                              onPressed: () {
                                pickImage(ImageSource.camera);
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/camera.2.svg',
                                color: Theme.of(context).iconTheme.color!,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                final message = MessageInfos(
                                  text: inputController.text,
                                  date: DateTime.now(),
                                  isSentByMe: true,
                                );
                                setState(() {
                                  messages.add(message);
                                  inputController.clear();
                                  index = 0;
                                });
                                sendMessage(
                                  inputController.text,
                                  [widget.conversationInfo.sender.name],
                                );
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/send.3.svg',
                                color: Theme.of(context).iconTheme.color!,
                              ),
                            ),
                      index == 0
                          ? IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/voice.svg',
                                color: Theme.of(context).iconTheme.color!,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),

                // Expanded(
                //   child: StreamMessageListView(),
                // ),
                // StreamMessageInput(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryItemBuilder(String icon, String text) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ClipOval(
            child: SvgPicture.asset(
              icon,
              color: Colors.red,
            ),
          ),
          // Spacer(),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              // color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget menuChild() {
    final parser = EmojiParser();
    return Row(
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: parser.emojify('heart'),
          ),
        ]))
      ],
    );
  }

  Future messageSnackbar() async => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          // animation: Tween(begin: 12.0, end: 50.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          duration: Duration(milliseconds: 3000),
          content: Container(
            // margin: EdgeInsets.all(2),
            child: Text(
              'Selected: Favorite',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      // setState(() {
      //   this.image = imageTemporary;
      // });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditPageScreen(image: imageTemporary),
        ),
      );
    } on PlatformException catch (e) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: Text(
            'Oups!!',
            style: TextStyle(
              // color: kPrimaryColor,
              fontSize: 18,
              fontFamily: 'ArialRoundedBold',
            ),
          ),
          message: Text(
            'Sorry!! An error occured',
            style: TextStyle(
              // color: kPrimaryColor,
              fontSize: 14,
              fontFamily: 'ArialRoundedBold',
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              // onPressed: () => imageGallerypicker(ImageSource.camera, context),
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Retry'),
            ),
          ],
        ),
      );
    }
  }
}

class EditPageScreen extends StatelessWidget {
  final File image;

  const EditPageScreen({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final inputController1 = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            color: Theme.of(context).iconTheme.color!,
          ),
        ),
        title: Text(
          'Edit Image',
          style: TextStyle(
            // color: kPrimaryColor,
            fontFamily: 'Comfortaa_regular',
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/edit.6.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Container(
                  height: 30,
                  child: TextField(
                    controller: inputController1,
                    onChanged: (String value) {
                      print(value);
                    },
                    onSubmitted: (String text) {},
                    cursorWidth: 1.0,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.8),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(1000.0),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.8),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(1000.0),
                        ),
                        // gapPadding: 2.0,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 8.0,
                      ),
                      hintText: 'type a message',
                      hintStyle: TextStyle(
                        // color: kPrimaryColor,
                        fontFamily: 'Comfortaa_light',
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  // final message = Message(
                  //   text: inputController.text,
                  //   date: DateTime.now(),
                  //   isSentByMe: true,
                  // );
                  // setState(() {
                  //   messages.add(message);
                  //   inputController.clear();
                  //   index = 0;
                  // });
                },
                icon: SvgPicture.asset(
                  'assets/icons/send.3.svg',
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomChatBubble extends CustomPainter {
  const CustomChatBubble({
    required this.context,
    required this.isOwn,
  });
  final BuildContext context;
  final bool isOwn;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isOwn
          ? Theme.of(context).primaryColor
          : Theme.of(context).iconTheme.color ?? Colors.blue;

    Path paintBubbleTail() {
      Path path = Path();
      if (!isOwn) {
        path = Path()
          ..moveTo(5, size.height - 5)
          ..quadraticBezierTo(-2, size.height, -6, size.height - 2)
          ..quadraticBezierTo(-2, size.height - 2, 0, size.height - 15);
      }
      if (isOwn) {
        path = Path()
          ..moveTo(size.width - 6, size.height - 4)
          ..quadraticBezierTo(
              size.width + 2, size.height, size.width + 6, size.height - 2)
          ..quadraticBezierTo(
              size.width + 2, size.height - 2, size.width, size.height - 15);
      }
      return path;
    }

    final RRect bubbleBody = RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(16));
    final Path bubbleTail = paintBubbleTail();

    canvas.drawRRect(bubbleBody, paint);
    canvas.drawPath(bubbleTail, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
