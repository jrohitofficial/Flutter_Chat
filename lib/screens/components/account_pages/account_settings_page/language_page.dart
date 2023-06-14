import 'package:flutter/material.dart';
import 'package:one_chat/main.dart';

class LanguageScreen extends StatefulWidget {
  final String title;

  const LanguageScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
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
                languageItemBuilder(
                  context,
                  'System Language',
                  0,
                ),
                // Radio 2
                languageItemBuilder(
                  context,
                  'English',
                  1,
                ),
                // Radio 3
                languageItemBuilder(
                  context,
                  'French',
                  2,
                ),
                // Radio 4
                languageItemBuilder(
                  context,
                  'Spanish',
                  3,
                ),
                // Radio 5
                languageItemBuilder(
                  context,
                  'German',
                  4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget languageItemBuilder(
    BuildContext context,
    String title,
    int value,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: new TextStyle(fontSize: 17.0),
          ),
          Radio(
            activeColor: Theme.of(context).iconTheme.color,
            value: value,
            groupValue: id,
            onChanged: (val) {
              setState(() {
                // _radioValue = true;
                id = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
