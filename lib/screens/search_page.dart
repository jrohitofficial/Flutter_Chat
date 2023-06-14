import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_chat/constant.dart';
import 'package:one_chat/main.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final inputController = TextEditingController();
  int index = 0;
  List searchResult = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100.0),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Container(
                    height: 40,
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
                          // pickImage(ImageSource.camera);
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/search.svg',
                          color: Theme.of(context).iconTheme.color,
                        ),
                      )
                    : IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/send.3.svg',
                          color: Theme.of(context).iconTheme.color,
                          height: 40,
                          width: 40,
                        ),
                      ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          padding: EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Center(
                      child: SvgPicture.asset(
                        'assets/icons/image.1.svg',
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Text(
                    'Image',
                    style: TextStyle(
                      // color: kPrimaryColor,
                      fontSize: 10,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/video.1.svg',
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    'Video',
                    style: TextStyle(
                      // color: kPrimaryColor,
                      fontSize: 10,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/document.2.svg',
                      color: Colors.blueGrey,
                    ),
                  ),
                  Text(
                    'Document',
                    style: TextStyle(
                      // color: kPrimaryColor,
                      fontSize: 10,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/discovery.1.svg',
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'Other',
                    style: TextStyle(
                      // color: kPrimaryColor,
                      fontSize: 10,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/profile.3.svg',
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      // color: kPrimaryColor,
                      fontSize: 10,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        searchResult.isEmpty
            ? Expanded(
                // height: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/1_Cloud_logo.svg',
                      color: Theme.of(context).iconTheme.color,
                      height: 75,
                      width: 75,
                    ),
                    Text(
                      'No research!!!',
                      style: TextStyle(
                        // color: kPrimaryColor,
                        fontFamily: 'Comfortaa_bold',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )
            : Container()
      ],
    );
  }
}
