import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:one_chat/constant.dart';
import 'package:one_chat/main.dart';

class PasswordScreen extends StatefulWidget {
  final String title;

  const PasswordScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _radioValue = false;
  int id = 1;
  // Variables to get user entries
  final my_con_1 = TextEditingController();
  final my_con_2 = TextEditingController();
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
                        padding: EdgeInsets.symmetric(vertical: 30.0),
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
                id == 0
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text('Set your password'),
                      )
                    : Container(),
                id == 0
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text('Password'),
                      )
                    : Container(),
                id == 0
                    ? Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 13,
                            // height: 1.,
                          ),
                          cursorColor: Theme.of(context).iconTheme.color,
                          decoration: InputDecoration(
                            icon: SvgPicture.asset(
                              'assets/icons/lock.6.svg',
                              color: Theme.of(context).iconTheme.color,
                            ),
                            hintText: 'enter your password',
                          ),
                          // value: dropdownvalue_1,
                          controller: my_con_1,
                          validator: RequiredValidator(
                            errorText: 'Please enter your password',
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 40,
                ),
                id == 0
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text('Confirm Password'),
                      )
                    : Container(),
                id == 0
                    ? Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          cursorColor: Theme.of(context).iconTheme.color,
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 13,
                            // height: 1.5,
                          ),
                          decoration: InputDecoration(
                            icon: SvgPicture.asset(
                              'assets/icons/lock.6.svg',
                              color: Theme.of(context).iconTheme.color,
                            ),
                            hintText: 'cofirm your password',
                          ),
                          // value: dropdownvalue_1,
                          controller: my_con_2,
                          validator: RequiredValidator(
                            errorText: 'Please confirm your password',
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 50,
                ),

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
                            onTap: () {
                              if (_dropdownFormKey.currentState!.validate()) {
                                if (my_con_1.text == my_con_2.text) {
                                  UserSimplePreferences
                                      .setPasswordSecurityDetails(
                                    my_con_1.text,
                                  );
                                  UserSimplePreferences.setPasswordSecurity(
                                      true);
                                } else {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) => CupertinoActionSheet(
                                      title: Text(
                                        'Error',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.red,
                                        ),
                                      ),
                                      message: Text(
                                        "Password doesn't match\nPlease retry!!",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      actions: [
                                        CupertinoActionSheetAction(
                                          // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                                          onPressed: () {
                                            my_con_2.clear();
                                          },
                                          child: Text(
                                            'Retry',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text(
                              'Set Password',
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
}
