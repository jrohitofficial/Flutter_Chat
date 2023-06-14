import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:one_chat/functions.dart';
import 'package:one_chat/main.dart';

class PatternScreen extends StatefulWidget {
  final String title;

  const PatternScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<PatternScreen> createState() => _PatternScreenState();
}

class _PatternScreenState extends State<PatternScreen> {
  bool _radioValue = false;
  int id = 1;
// Form key
  final _dropdownFormKey = GlobalKey<FormState>();
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _dropdownFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Radio 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Active Security',
                      style: new TextStyle(fontSize: 17.0),
                    ),
                    Radio(
                      activeColor: Theme.of(context).iconTheme.color,
                      value: 0,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          _radioValue = true;
                          id = 0;
                        });
                      },
                    ),
                  ],
                ), // Radio 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Disable Security',
                      style: new TextStyle(fontSize: 17.0),
                    ),
                    Radio(
                      activeColor: Theme.of(context).iconTheme.color,
                      value: 1,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          _radioValue = false;
                          id = 1;
                        });
                      },
                    ),
                  ],
                ),

                id == 0
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 30.0,
                          horizontal: 100.0,
                        ),
                        child: Container(
                          width: double.maxFinite,
                          height: 1,
                          color: Theme.of(context)
                              .iconTheme
                              .color!
                              .withOpacity(0.5),
                        ),
                      )
                    : Container(),

                // Submit Button

                id == 0
                    ? Center(
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () async {
                              // Directory newDirectory =
                              //     await Directory("/sdcard/One Chat")
                              //         .create(recursive: true);
                              // print(newDirectory);
                              // fingerPrintConfiguration();
                              final isAvailable =
                                  await FingerPrintScanner.hasBiometrics();
                              final isBiometricSupported =
                                  await FingerPrintScanner
                                      .isBiometricSupported();
                              final biometrics =
                                  await FingerPrintScanner.getBiometrics();
                              final hasFingerPrint = biometrics
                                  .contains(BiometricType.fingerprint);
                              print(hasFingerPrint);
                              showCupertinoModalPopup(
                                context: context,
                                builder: (context) => CupertinoActionSheet(
                                  title: Text(
                                    'Biometrics availability',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Comfortaa_bold',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  message: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 8.0),
                                        child: Center(
                                          child: Text(
                                            'Here are available biometrics type on your phone',
                                            style: TextStyle(
                                              // fontSize: 14,
                                              fontFamily: 'Comfortaa_bold',
                                            ),
                                          ),
                                        ),
                                      ),
                                      builText(
                                          'Biometrics Supported', isAvailable),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      builText(
                                          'Can Check Biometrics', isAvailable),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      builText('FingerPrint', hasFingerPrint),
                                    ],
                                  ),
                                  actions: [
                                    CupertinoActionSheetAction(
                                      // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        final isAuthenticated =
                                            await FingerPrintScanner
                                                .authentication();
                                        if (isAuthenticated) {
                                          fingerPrintConfiguration();
                                        }
                                      },
                                      child: Text(
                                        'Ok',
                                        style: TextStyle(
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          fontSize: 16,
                                          fontFamily: 'Comfortaa_bold',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                              // FingerPrintScanner.authentication();
                            },
                            child: Text(
                              'Check Availablity',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget builText(String title, bool checked) => Row(
        children: [
          checked
              ? SvgPicture.asset(
                  'assets/icons/tick-square.svg',
                  color: Theme.of(context).iconTheme.color,
                )
              : SvgPicture.asset(
                  'assets/icons/close-square.4.svg',
                  color: Theme.of(context).iconTheme.color,
                ),
          SizedBox(width: 15),
          Text(
            title,
          ),
        ],
      );

  fingerPrintConfiguration() {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text(
          'FingerPrint Initializing',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Comfortaa_bold',
            fontWeight: FontWeight.bold,
          ),
        ),
        message: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 20.0,
                top: 5.0,
              ),
              child: SvgPicture.asset(
                'assets/icons/fingerprint.svg',
                color: Theme.of(context).iconTheme.color,
                height: 70,
                width: 70,
              ),
            ),
            Text(
              'Please set your finger on your fingerprint reader',
              style: TextStyle(
                // fontSize: 14,
                fontFamily: 'Comfortaa_bold',
              ),
            ),
          ],
        ),
        actions: [
          CupertinoActionSheetAction(
            // onPressed: () => imageGallerypicker(ImageSource.camera, context),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Ok',
              style: TextStyle(
                color: Theme.of(context).iconTheme.color,
                fontFamily: 'Comfortaa_bold',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
