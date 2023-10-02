import 'package:flutter/material.dart';
import 'package:study_case/responsive_layout/custom_media_query.dart';
import '../constants/colors.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        elevation: 0,
        title: Text('Login'),
        centerTitle: true,
      ),
      body: loginForm,
    );
  }

  Widget get loginForm {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(0.04)),
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
            ),
            SizedBox(height: getScreenHeight(0.05)),
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
