import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_chat/functions.dart';
import 'package:one_chat/main.dart';

class MyDataScreen extends StatefulWidget {
  @override
  State<MyDataScreen> createState() => _MyDataScreenState();
}

class _MyDataScreenState extends State<MyDataScreen> {
  List<List> blocks = [
    [
      'Images',
      0,
    ],
    [
      'Videos',
      0,
    ],
    [
      'Files',
      0,
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'My Data',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 25,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var element in blocks) dataBuilder(element),
          ],
        ),
      ),
    );
  }

  Widget dataBuilder(List item) {
    return Padding(
      padding: EdgeInsets.only(
        right: 20.0,
        left: 20.0,
        bottom: 20.0,
      ),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.maxFinite,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).iconTheme.color!,
                        ),
                      ),
                    ),
                    child: Text(item[0]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.maxFinite,
                    height: 40,
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   border: Border(
                    //     bottom: BorderSide(
                    //       color: Colors.black12,
                    //     ),
                    //   ),
                    // ),
                    child: item[1] == 0
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                item[1] = 1;
                              });
                            },
                            icon: SvgPicture.asset(
                              'assets/icons/arrow-down-2.1.svg',
                              color: Theme.of(context).iconTheme.color,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                item[1] = 0;
                              });
                            },
                            icon: SvgPicture.asset(
                              'assets/icons/arrow-up-2.4.svg',
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
