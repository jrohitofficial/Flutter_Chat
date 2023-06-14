import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:one_chat/main.dart';

class StorageScreen extends StatelessWidget {
  final String title;

  const StorageScreen({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'Save Photos/Videos in gallery',
                        style: TextStyle(
                          fontSize: 15,
                          // color: kPrimaryColor,
                        ),
                      ),
                    ),
                    GFToggle(
                      value: true,
                      onChanged: (value) {},
                      type: GFToggleType.ios,
                      enabledTrackColor:
                          Colors.blue, // Theme.of(context).iconTheme.color,
                      enabledThumbColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
