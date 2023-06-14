import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/getwidget.dart';
import 'package:one_chat/main.dart';

class NotificationsScreen extends StatefulWidget {
  final String title;

  const NotificationsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool id_0 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Notifications'),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Receive notifications for new messages',
                              style: TextStyle(
                                fontSize: 15,
                                // color: kPrimaryColor,
                              ),
                            ),
                          ),
                          GFToggle(
                            value: false,
                            onChanged: (value) {
                              setState(() {
                                id_0 = value!;
                              });
                            },
                            type: GFToggleType.ios,
                            enabledTrackColor: Colors
                                .blue, // Theme.of(context).iconTheme.color,
                            enabledThumbColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    id_0
                        ? Container(
                            margin: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Theme.of(context)
                                      .iconTheme
                                      .color!
                                      .withOpacity(0.4),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    id_0
                        ? Container(
                            margin: EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Show Details',
                                        style: TextStyle(
                                          fontSize: 15,
                                          // color: kPrimaryColor,
                                        ),
                                      ),
                                      Text(
                                        'Show sender and messages summary in notifications',
                                        style: TextStyle(
                                          fontSize: 12,
                                          // color: kPrimaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GFToggle(
                                  value: false,
                                  onChanged: (value) {},
                                  type: GFToggleType.ios,
                                  enabledTrackColor: Colors
                                      .blue, // Theme.of(context).iconTheme.color,
                                  enabledThumbColor: Colors.white,
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Sounds'),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New messages',
                              style: TextStyle(
                                fontSize: 15,
                                // color: kPrimaryColor,
                              ),
                            ),
                            Text(
                              'Adjust sound and vibration settings for new messages',
                              style: TextStyle(
                                fontSize: 12,
                                // color: kPrimaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/arrow-right-2.4.svg',
                        height: 20,
                        width: 20,
                        color: Theme.of(context).iconTheme.color!,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
