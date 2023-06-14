import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_chat/functions.dart';
import 'package:one_chat/main.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyProfileScreen extends StatelessWidget {
  final String username;
  const MyProfileScreen({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 25,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 20.0,
            left: 20.0,
            bottom: 20.0,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      width: double.maxFinite,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text('Personnal Informations'),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).iconTheme.color!,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Username:'),
                          Text('@Julie Queen'),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).iconTheme.color!,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Date of Birth:'),
                          Text('Juily 24, 2001'),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).iconTheme.color!,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Gender:'),
                          Text('Female'),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).iconTheme.color!,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Phone:'),
                          Text('690786195'),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).iconTheme.color!,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Email:'),
                          Text('nedaoukajoachim@gmail.com'),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Location:'),
                          Text('Ndere'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Share to invite',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: QrImage(
                  data: username + 'one_chat_app_username',
                  eyeStyle: QrEyeStyle(eyeShape: QrEyeShape.circle),
                  dataModuleStyle: QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.circle),
                  foregroundColor: Theme.of(context).iconTheme.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// QrImage(
//   data: "1234567890",
//   version: QrVersions.auto,
//   size: 200.0,
// ),