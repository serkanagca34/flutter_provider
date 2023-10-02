import 'package:flutter/material.dart';
import 'package:study_case/cache/cache.dart';
import 'package:study_case/components/indicator.dart';
import 'package:study_case/components/popups.dart';
import 'package:study_case/constants/colors.dart';
import 'package:study_case/providers/user_list_provider.dart';
import 'package:study_case/responsive_layout/custom_media_query.dart';
import 'package:study_case/view/login_view.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListView extends ConsumerStatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends ConsumerState<UserListView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(userListProvider).getUserList());
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userListProvider).userList;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackroundColor,
      appBar: appBar(context),
      body: ref.watch(userListProvider).isLoading
          ? indicator()
          : ListView.builder(
              itemCount: userData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(userData[index].avatar!)),
                  title: Text(
                      '${userData[index].firstName} ${userData[index].lastName}'),
                  subtitle: Text(userData[index].email!),
                );
              },
            ),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: kAppBarColor,
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
    );
  }
}
