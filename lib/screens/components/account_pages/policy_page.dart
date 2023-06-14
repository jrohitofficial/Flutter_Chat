import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:one_chat/functions.dart';
import 'package:one_chat/main.dart';

class PolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Policy',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 25,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color:
                            Theme.of(context).iconTheme.color!.withOpacity(0.4),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Require contacts request',
                          style: TextStyle(
                            fontSize: 15,
                            // color: kPrimaryColor,
                          ),
                        ),
                      ),
                      GFToggle(
                        value: false,
                        onChanged: (value) {},
                        type: GFToggleType.ios,
                        enabledTrackColor:
                            Colors.blue, // Theme.of(context).iconTheme.color,
                        enabledThumbColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Ways to connect to me',
                            style: TextStyle(
                              fontSize: 15,
                              // color: kPrimaryColor,
                            ),
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
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Blocklist',
                            style: TextStyle(
                              fontSize: 15,
                              // color: kPrimaryColor,
                            ),
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
      ),
    );
  }
}
