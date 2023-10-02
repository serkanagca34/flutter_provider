import 'package:flutter/material.dart';
import 'package:study_case/cache/cache.dart';
import 'package:study_case/components/popups.dart';
import 'package:study_case/responsive_layout/custom_media_query.dart';
import 'package:study_case/view/login_view.dart';

class UserListView extends StatefulWidget {
  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getScreenWidth(0.02)),
            child: IconButton(
              onPressed: () {
                alertPopup(
                  context,
                  title: 'Logout',
                  message: 'Do you want to exit the application?',
                  onPressedYes: () {
                    Cache().clear();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginView()),
                        (route) => false);
                  },
                  onPressedNo: () {
                    Navigator.of(context).pop();
                  },
                );
              },
              icon: Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
