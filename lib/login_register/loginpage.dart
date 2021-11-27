import 'package:interview_bot/Admin%20Screens/admin_nav.dart';

import 'color.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:interview_bot/Services/RESTServices.dart';
import 'package:interview_bot/Services/Storage.dart';
import 'package:interview_bot/User%20Screens/user_nav.dart';
import 'package:interview_bot/login_register/registrationpage.dart';
import 'package:interview_bot/login_register/splash_page.dart';
import 'package:interview_bot/widgets/button.dart';
import 'package:interview_bot/widgets/header.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final SecureStorage secureStorage = SecureStorage();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(email, password) async {
    final url = "http://10.0.2.2:8000/api/login/";
    await http.post(Uri.parse(url),
        body: {"email": email, "password": password}).then((response) {
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200) {
        secureStorage.writeSecureData('user_id', responseMap['user_id']);
        secureStorage.writeSecureData('is_admin', responseMap['is_admin']);
        secureStorage.writeSecureData('is_staff', responseMap['is_staff']);
        secureStorage.writeSecureData('is_active', responseMap['is_active']);
        secureStorage.writeSecureData('email', responseMap['email']);
        secureStorage.writeSecureData('firstname', responseMap['firstname']);
        secureStorage.writeSecureData('lastname', responseMap['lastname']);
        secureStorage.writeSecureData('gender', responseMap['gender']);
        secureStorage.writeSecureData('phone', responseMap['phone']);
        secureStorage.writeSecureData('token', responseMap['token']);

        finalToken = responseMap['token'];
        finalUserId = responseMap['user_id'].toString();
        finalFirstName = responseMap['firstname'];
        finalLastName = responseMap['lastname'];
        finalEmail = responseMap['email'];
        finalPhone = responseMap['phone'];
        finalGender = responseMap['gender'];
        finalIsAdmin = responseMap['is_admin'].toString();

        if (responseMap['is_admin'] == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminNav(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserNav(),
            ),
          );
        }
      } else {
        if (responseMap.containsKey("detail"))
          showDialog(
              context: context,
              builder: (BuildContext context) => getAlertDialog(
                  "Login failed", '${responseMap["detail"]}', context));
      }
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              getAlertDialog("Login failed", '${err.toString()}', context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.only(bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Header("LOGIN"),
              SizedBox(height: 35),
              Container(
                //flex: 1,
                child: Container(
                  margin:
                      EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                  child: Form(
                    key: this._formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        _emailInput(
                            controller: emailController, hint: "Email "),
                        _passInput(
                            controller: passwordController, hint: "Password"),
                        SizedBox(height: 10),
                        Container(
                          child: Center(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    toResetPasswordWebsite();
                                  },
                                  child: Container(
                                    //margin: EdgeInsets.only(top:10),
                                    width: 180,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [trans, trans],
                                          end: Alignment.centerLeft,
                                          begin: Alignment.centerRight),
                                      borderRadius:
                                          //BorderRadius.all(Radius.circular(100),
                                          BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Column(
                            children: [
                              MaroonButton(
                                onClick: () {
                                  if (this._formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    login(emailController.text,
                                        passwordController.text);
                                  }
                                },
                                btnText: "LOGIN",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegistrationPage()));
                                },
                                child: Container(
                                  //margin: EdgeInsets.only(top:10),
                                  width: 180,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [trans, trans],
                                        end: Alignment.centerLeft,
                                        begin: Alignment.centerRight),
                                    borderRadius:
                                        //BorderRadius.all(Radius.circular(100),
                                        BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailInput({controller, hint}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: gold,
      ),
      //padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: emailController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }

  Widget _passInput({controller, hint}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: gold,
      ),
      //padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        obscureText: true,
        controller: passwordController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }
}
