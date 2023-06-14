import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class AddFolderScreen extends StatefulWidget {
  @override
  State<AddFolderScreen> createState() => _AddFolderScreenState();
}

class _AddFolderScreenState extends State<AddFolderScreen> {
  bool index = true;
  final folderNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Add Folder',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Folder name',
                style: TextStyle(
                  // color: kPrimaryColor,
                  fontSize: 15,
                  fontFamily: 'Comfortaa_bold',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: TextField(
                  controller: folderNameController,
                  cursorColor: Theme.of(context).iconTheme.color,
                  decoration: InputDecoration(
                    hintText: 'folder name',
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color:
                            Theme.of(context).iconTheme.color!.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ),
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
                        'Include chats',
                        style: TextStyle(
                          fontSize: 15,
                          // color: kPrimaryColor,
                        ),
                      ),
                    ),
                    GFToggle(
                      value: index,
                      onChanged: (value) {
                        setState(() {
                          index = false;
                        });
                      },
                      type: GFToggleType.ios,
                      enabledTrackColor:
                          Colors.blue, // Theme.of(context).iconTheme.color,
                      enabledThumbColor: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
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
                        'Exclude chats',
                        style: TextStyle(
                          fontSize: 15,
                          // color: kPrimaryColor,
                        ),
                      ),
                    ),
                    GFToggle(
                      value: !index,
                      onChanged: (value) {
                        setState(() {
                          index = true;
                        });
                      },
                      type: GFToggleType.ios,
                      enabledTrackColor:
                          Colors.blue, // Theme.of(context).iconTheme.color,
                      enabledThumbColor: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15.0,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text('Create Folder'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
