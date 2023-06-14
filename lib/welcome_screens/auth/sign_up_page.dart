import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:one_chat/welcome_screens/auth/sign_in_page.dart';
import 'package:one_chat/welcome_screens/start_screen.dart';
import 'package:socket_client/socket_client.dart';

class SignUpScreen extends StatefulWidget {
  final List<String>? userInfo;
  const SignUpScreen({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? username;

  // Variables to get user entries
  final myCon1 = TextEditingController();
  final myCon2 = TextEditingController();
  final myCon3 = TextEditingController();
  final myCon4 = TextEditingController();
  final myCon5 = TextEditingController();
  final myCon6 = TextEditingController();

  // Form key
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        'Sign Up',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      actions: [],
    );

    return Scaffold(
      // appBar: appBar,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            right: -MediaQuery.of(context).size.width * 0.8,
            bottom: 0,
            child: SvgPicture.asset(
              'assets/images/one_chat_logo.svg',
              // color: Colors.white,
              // colorBlendMode: BlendMode.modulate,
              // width: MediaQuery.of(context).size.width * 3,
              height: MediaQuery.of(context).size.height * 0.6,
            ),
          ),
          SafeArea(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () => Platform.isAndroid
                                ? SystemNavigator.pop()
                                : exit(0),
                            icon: SvgPicture.asset(
                              'assets/icons/logout.6.svg',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Spacer(),
                      Text(
                        'Create\nyour account',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Form(
                        key: _dropdownFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                            ),

                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: TextFormField(
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  icon: SvgPicture.asset(
                                    'assets/icons/profile.4.svg',
                                    color: Colors.white,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  hintText: 'enter your username',
                                ),
                                // value: dropdownvalue_1,
                                controller: myCon1,
                                onChanged: (text) {
                                  setState(() {
                                    username = '@$text';
                                  });
                                },
                                validator: RequiredValidator(
                                  errorText: 'Please enter your username',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  icon: SvgPicture.asset(
                                    'assets/icons/call.1.svg',
                                    color: Colors.white,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  hintText: 'enter your phone',
                                ),
                                // value: dropdownvalue_1,
                                controller: myCon3,

                                validator: RequiredValidator(
                                  errorText: 'Please enter your phone number',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  icon: SvgPicture.asset(
                                    'assets/icons/message.svg',
                                    color: Colors.white,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  hintText: 'enter your email',
                                ),
                                // value: dropdownvalue_1,
                                controller: myCon4,

                                validator: RequiredValidator(
                                  errorText: 'Please enter your email',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  icon: SvgPicture.asset(
                                    'assets/icons/lock.6.svg',
                                    color: Colors.white,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  hintText: 'enter your password',
                                ),
                                // value: dropdownvalue_1,
                                controller: myCon5,
                                validator: RequiredValidator(
                                  errorText: 'Please enter your password',
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 50,
                            ),

                            // Submit Button
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50.0),
                              child: Container(
                                padding: EdgeInsets.all(12.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10000),
                                ),
                                width: double.maxFinite,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyHomePage(
                                          userInfo: widget.userInfo,
                                        ),
                                      ),
                                    );
                                    // if (_dropdownFormKey.currentState!
                                    //     .validate()) {
                                    //   showCupertinoModalPopup(
                                    //     context: context,
                                    //     builder: (context) =>
                                    //         CupertinoActionSheet(
                                    //       title: Text(
                                    //         'Succes!!',
                                    //         style: TextStyle(
                                    //           fontSize: 14,
                                    //         ),
                                    //       ),
                                    //       message: Text(
                                    //         'Your informations have been well validated',
                                    //         style: TextStyle(
                                    //           fontSize: 14,
                                    //         ),
                                    //       ),
                                    //       actions: [
                                    //         CupertinoActionSheetAction(
                                    //           // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                                    //           onPressed: () {},
                                    //           child: Text(
                                    //             'Ok',
                                    //             style: TextStyle(
                                    //               fontSize: 14,
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   );
                                    // }
                                  },
                                  child: Text(
                                    'Connect',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(5, 35, 61, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already on One Chat?',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => SignInScreen(
                                        userInfo: widget.userInfo,
                                      )),
                                ),
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
