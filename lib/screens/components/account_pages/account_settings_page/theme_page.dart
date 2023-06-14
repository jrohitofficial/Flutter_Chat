import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:one_chat/constant.dart';
import 'package:one_chat/main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeScreen extends StatefulWidget {
  final String title;

  const ThemeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  int index = 0;
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
                        'Change the theme',
                        style: TextStyle(
                          fontSize: 15,
                          // color: kPrimaryColor,
                        ),
                      ),
                    ),
                    ChangeThemeModeButton(),
                    // InkWell(
                    //   onTap: () async {
                    //     final perfs =
                    //         await SharedPreferences.getInstance();
                    //     setState(() {
                    //       if (index == 0) {
                    //         index = 1;
                    //       } else {
                    //         index = 0;
                    //       }
                    //     });
                    //     if (index == 0) {
                    //       await perfs.setInt('isdark', 0);
                    //     } else {
                    //       await perfs.setInt('isdark', 1);
                    //     }
                    //     final int? coo = perfs.getInt('isdark');
                    //     print(coo);
                    //   },
                    //   child: Container(
                    //     padding: EdgeInsets.all(2.0),
                    //     width: 55,
                    //     height: 30,
                    //     decoration: index == 0
                    //         ? BoxDecoration(
                    //             color: kPrimaryColor,
                    //             borderRadius: BorderRadius.circular(20),
                    //           )
                    //         : BoxDecoration(
                    //             borderRadius: BorderRadius.circular(20),
                    //             border: Border.all(
                    //               color:
                    //                   Color.fromARGB(255, 170, 170, 170),
                    //               width: 0.1,
                    //             ),
                    //             // color: Color.fromARGB(255, 238, 238, 238),
                    //             gradient: RadialGradient(
                    //               radius: 3,
                    //               colors: [
                    //                 Colors.white,
                    //                 Color.fromARGB(255, 160, 160, 160),
                    //               ],
                    //             ),
                    //           ),
                    //     child: Row(
                    //       mainAxisAlignment: index == 0
                    //           ? MainAxisAlignment.start
                    //           : MainAxisAlignment.end,
                    //       children: [
                    //         Container(
                    //           width: 25,
                    //           height: 30,
                    //           decoration: BoxDecoration(
                    //             color: index == 0
                    //                 ? Colors.white
                    //                 : containerTheme,
                    //             borderRadius: BorderRadius.circular(20),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
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

class ChangeThemeModeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GFToggle(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value!);
      },
      enabledTrackColor: Colors.blue, // Theme.of(context).iconTheme.color,
      enabledThumbColor: Colors.white,
      type: GFToggleType.ios,
    );
  }
}
