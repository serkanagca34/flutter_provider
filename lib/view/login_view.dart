import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_case/components/indicator.dart';
import 'package:study_case/providers/login_provider.dart';
import 'package:study_case/responsive_layout/custom_media_query.dart';
import 'package:study_case/view/user_list_view.dart';
import '../constants/colors.dart';

class LoginView extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _errorMessage = ref.watch(loginProvider).errorMessage;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        elevation: 0,
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(0.04)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getScreenHeight(0.10)),
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: getScreenHeight(0.07)),
                // Email Address
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter Your Email Adress",
                    label: Text("Email"),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kInputBorderColor),
                      gapPadding: 10,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kInputBorderColor),
                      gapPadding: 10,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  ),
                  onChanged: (value) {
                    value = _emailController.text;
                    print('email: ${_emailController.text}');
                  },
                ),
                // Error Messages
                Visibility(
                  visible: ref.watch(loginProvider).isError,
                  child: Padding(
                    padding: EdgeInsets.only(top: getScreenHeight(0.01)),
                    child: Row(
                      children: [
                        Icon(Icons.error, color: Colors.red, size: 15),
                        SizedBox(width: getScreenWidth(0.01)),
                        Text(
                          _errorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getScreenHeight(0.05)),
                // Password
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    label: Text("Password"),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kInputBorderColor),
                      gapPadding: 10,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kInputBorderColor),
                      gapPadding: 10,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  ),
                  onChanged: (value) {
                    value = _passwordController.text;
                    print('password: ${_passwordController.text}');
                  },
                ),
                // Error Messages
                Visibility(
                  visible: ref.watch(loginProvider).isError,
                  child: Padding(
                    padding: EdgeInsets.only(top: getScreenHeight(0.01)),
                    child: Row(
                      children: [
                        Icon(Icons.error, color: Colors.red, size: 15),
                        SizedBox(width: getScreenWidth(0.01)),
                        Text(
                          _errorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getScreenHeight(0.02)),
                // Loading Indicator
                ref.watch(loginProvider).isLoading
                    ? indicator()
                    : SizedBox.shrink(),
                SizedBox(height: getScreenHeight(0.02)),
                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: kButtonColor,
                    ),
                    child: Text(
                      "Sing in",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      var isLogin = ref.watch(loginProvider).login(
                          _emailController.text, _passwordController.text);

                      ref.watch(loginProvider).isError = false;

                      if (await isLogin) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserListView()),
                            (route) => false);
                      }
                    },
                  ),
                ),
                SizedBox(height: getScreenHeight(0.03)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
