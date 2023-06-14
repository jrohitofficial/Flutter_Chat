import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.maybePop(context),
        icon: SvgPicture.asset(
          'assets/icons/arrow-left.svg',
          color: Theme.of(context).iconTheme.color!,
        ),
      ),
      title: Text(
        'My Contacts',
        style: TextStyle(
          color: Theme.of(context).iconTheme.color,
          fontSize: 25,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: Column(),
    );
  }
}
