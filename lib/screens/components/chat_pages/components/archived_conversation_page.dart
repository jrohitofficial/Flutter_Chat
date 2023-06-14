import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:one_chat/screens/chat_page.dart';
import 'package:one_chat/screens/components/chat_pages/chat_space.dart';
import 'package:socket_client/socket_client.dart';
import 'package:badges/badges.dart' as badges;


class ArchivedConversationScreen extends StatefulWidget {
  final double appBarHeightSize;
  const ArchivedConversationScreen({
    Key? key,
    required this.appBarHeightSize,
  }) : super(key: key);

  @override
  State<ArchivedConversationScreen> createState() =>
      _ArchivedConversationScreenState();
}

class _ArchivedConversationScreenState
    extends State<ArchivedConversationScreen> {
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
          'Archived',
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
            for (var item in archivedConversationInfo)
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
                          direction == DismissDirection.endToStart
                              ? oneChatMessages.remove(item)
                              : oneChatMessages.indexOf(item);
                        },
                      ),
                  child: conversationBuilder(context, screenWidth, item)),
          ],
        ),
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
