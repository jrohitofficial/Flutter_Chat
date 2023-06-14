import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:one_chat/screens/components/chat_pages/chat_space.dart';
import 'package:one_chat/screens/components/chat_pages/components/archived_conversation_page.dart';
import 'package:one_chat/screens/components/contacts_page.dart';
import 'package:one_chat/screens/components/scan_page.dart';
import 'package:socket_client/socket_client.dart';
import 'package:badges/badges.dart' as badges;

class ConversationInfo {
  final String image, username, badge;
  final List message;

  const ConversationInfo({
    Key? key,
    required this.image,
    required this.username,
    required this.message,
    required this.badge,
  });
}

List<MessageInfos> messages = [
  MessageInfos(
    text: 'Hey bro!!',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  MessageInfos(
    text: "What's up?",
    date: DateTime.now().subtract(Duration(minutes: 2)),
    isSentByMe: true,
  ),
  MessageInfos(
    text:
        'What a good day to go outside hgcgoahehiohfqbfioeohiappvviovbeskbdv ggggggg!!',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  MessageInfos(
    text: 'Yes sure',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: true,
  ),
  MessageInfos(
    text: 'Wanna join us today',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  MessageInfos(
    text: 'Yes sure',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  MessageInfos(
    text: 'Yes sure',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: true,
  ),
  MessageInfos(
    text: 'Yes sure',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  MessageInfos(
    text: 'Yes sure',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  MessageInfos(
    text: 'Yes sure',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  MessageInfos(
    text: 'Yes sure',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: true,
  ),
].reversed.toList();

List archivedConversationInfo = [];

List conversationInfos = [
  ConversationInfo(
    image: 'assets/images/1.png',
    username: '@Ulrich',
    message: messages,
    badge: '02',
  ),
  ConversationInfo(
    image: 'assets/images/6.png',
    username: '@Youmix',
    message: messages,
    badge: '10',
  ),
  ConversationInfo(
    image: 'assets/images/girl_studying_with_music.png',
    username: '@Julie',
    message: messages,
    badge: '07',
  ),
  ConversationInfo(
    image: 'assets/images/4.png',
    username: '@Nancy',
    message: messages,
    badge: '15',
  ),
  ConversationInfo(
    image: 'assets/images/2.png',
    username: '@Johannes',
    message: messages,
    badge: '04',
  ),
  ConversationInfo(
    image: 'assets/images/5.png',
    username: '@Bro',
    message: messages,
    badge: '02',
  ),
  ConversationInfo(
    image: 'assets/images/3.png',
    username: '@Manou',
    message: messages,
    badge: '10',
  ),
  ConversationInfo(
    image: 'assets/images/7.png',
    username: '@Julienne',
    message: messages,
    badge: '07',
  ),
  ConversationInfo(
    image: 'assets/images/8.png',
    username: '@Junior',
    message: messages,
    badge: '15',
  ),
  ConversationInfo(
    image: 'assets/images/10.png',
    username: '@Anne',
    message: messages,
    badge: '04',
  ),
];

class ChatScreen extends StatefulWidget {
  final double appBarHeightSize;
  const ChatScreen({
    Key? key,
    required this.appBarHeightSize,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final inputController = TextEditingController();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // return StreamChannelListView(
    //     controller: _listController,
    //     itemBuilder: _channelTileBuilder,
    //     onChannelTap: (channel) {
    //       Navigator.of(context).push(
    //         MaterialPageRoute(
    //           builder: (context) {
    //             return StreamChannel(
    //               channel: channel,
    //               child: ChannelPage(),
    //             );
    //           },
    //         ),
    //       );
    //     });

    return oneChatMessages.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start Chatting Now',
                style: TextStyle(
                  // color: kPrimaryColor,
                  fontFamily: 'Comfortaa_bold',
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/arrow-down.6.svg',
                    color: Theme.of(context).iconTheme.color,
                    // height: 75,
                    // width: 75,
                  ),
                  SvgPicture.asset(
                    'assets/icons/arrow-down.6.svg',
                    color: Theme.of(context).iconTheme.color,
                    // height: 75,
                    // width: 75,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => ContactsScreen()),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Container(
                        color: Colors.blue,
                        padding: EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          'assets/icons/plus.6.svg',
                          color: Theme.of(context).iconTheme.color,
                          // height: 75,
                          // width: 75,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScanScreen(
                              appBarHeightSize: widget.appBarHeightSize),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Container(
                        color: Colors.blue,
                        padding: EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          'assets/icons/scan.svg',
                          color: Theme.of(context).iconTheme.color,
                          // height: 75,
                          // width: 75,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                archivedConversationInfo.isNotEmpty
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ArchivedConversationScreen(
                                        appBarHeightSize:
                                            widget.appBarHeightSize),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/download.2.svg',
                                  color: Theme.of(context).iconTheme.color,
                                  // height: 30,
                                  // width: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 70,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Archived',
                                          style: TextStyle(
                                            // color: kPrimaryColor,
                                            fontSize: 15,
                                            fontFamily: 'Comfortaa_regular',
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/arrow-right-circle.4.svg',
                                          height: 20,
                                          width: 20,
                                          color: Theme.of(context)
                                              .iconTheme
                                              .color!
                                              .withOpacity(0.7),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(),
                for (var item in oneChatMessages)
                  Dismissible(
                      key: ValueKey<int>(oneChatMessages.indexOf(item)),
                      direction: DismissDirection.horizontal,
                      secondaryBackground: Container(
                        color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/delete.3.svg',
                              color: Colors.white,
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      background: Container(
                        color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/icons/download.2.svg',
                              color: Colors.white,
                              height: 30,
                              width: 30,
                            ),
                          ],
                        ),
                      ),
                      onDismissed: (DismissDirection direction) => setState(
                            () {
                              if (direction == DismissDirection.endToStart) {
                                oneChatMessages.remove(item);
                              } else {
                                oneChatMessages.remove(item);
                                archivedConversationInfo.add(item);
                              }
                            },
                          ),
                      child: conversationBuilder(context, screenWidth, item)),
              ],
            ),
          );
  }

  Widget conversationBuilder(
    BuildContext context,
    double screenWidth,
    MessageDetails item,
  ) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatSpace(
            conversationInfo: item,
            message: messages,
            appBarHeightSize: widget.appBarHeightSize,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 2.0,
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                item.sender.image,
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.5,
                ),
                height: 50,
                // width: (screenWidth / 100) * 65,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Spacer(),
                    Text(
                      item.sender.name,
                      style: TextStyle(
                        // color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Spacer(),

                    Text(
                      item.message.last.text,
                    ),
                    // Spacer(),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  DateFormat.Hm().format(item.message.last.date),
                ),
                badges.Badge(
                  animationType: BadgeAnimationType.scale,
                  badgeColor: Colors.blueAccent,
                  position: BadgePosition.center(),
                  badgeContent: Text(
                    item.message.length.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/arrow-right-2.4.svg',
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
