import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interview_bot/Admin%20Screens/nav.dart';
import 'package:interview_bot/Services/Storage.dart';
import 'package:interview_bot/User%20Screens/homePage/homePage.dart';
import 'package:interview_bot/login_register/color.dart';
import 'package:interview_bot/login_register/loginpage.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

String? finalToken,
    finalUserId,
    finalFirstName,
    finalLastName,
    finalEmail,
    finalPhone,
    finalGender,
    finalIsAdmin;

class _SplashPageState extends State<SplashPage> {
  final SecureStorage secureStorage = SecureStorage();

  @override
  void initState() {
    super.initState();

    secureStorage.readSecureData('token').then((value) {
      finalToken = value;

      if (value != null) {
        secureStorage.readSecureData('user_id').then((value) {
          finalUserId = value;
        });

        secureStorage.readSecureData('firstname').then((value) {
          finalFirstName = value;
        });

        secureStorage.readSecureData('lastname').then((value) {
          finalLastName = value;
        });

        secureStorage.readSecureData('email').then((value) {
          finalEmail = value;
        });

        secureStorage.readSecureData('phone').then((value) {
          finalPhone = value;
        });

        secureStorage.readSecureData('gender').then((value) {
          finalGender = value;
        });

        secureStorage.readSecureData('is_admin').then((value) {
          finalIsAdmin = value.toString();
        });
      }
    });

    // secureStorage.deleteAllSecureData();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: finalToken == null
                  ? LoginPage()
                  : finalIsAdmin == "true"
                      ? AdminNav()
                      : HomePage(),
              type: PageTransitionType.rightToLeftWithFade));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [white, white],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter),
      ),
      child: Center(
        child: new Image.asset("assets/images/favicon.png",
            width: 150, height: 150),
      ),
    ));
  }
}
