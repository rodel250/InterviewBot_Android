import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/Admin%20Screens/nav.dart';
import 'package:interview_bot/login_register/registrationpage.dart';
import 'package:interview_bot/User%20Screens/homePage/homePage.dart';
import 'package:interview_bot/widgets/button.dart';
import 'package:interview_bot/widgets/header.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'color.dart';

AlertDialog getAlertDialog(title, content, context) {
  return AlertDialog(
    title: Text("Login failed"),
    content: Text('$content'),
    actions: <Widget>[
      TextButton(
        child: Text('Close'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class UserData extends _LoginData {
  int id = 0;
  bool isAdmin = false;
  bool isStaff = false;
  bool isActive = false;
  String firstname = '';
  String lastname = '';
  String gender = '';
  String phone = '';
  String token = '';

  void addData(Map<String, dynamic> responseMap) {
    this.id = responseMap['user_id'];
    this.isAdmin = responseMap['is_admin'];
    this.isStaff = responseMap['is_staff'];
    this.isActive = responseMap['is_active'];
    this.email = responseMap['email'];
    this.firstname = responseMap['firstname'];
    this.lastname = responseMap['lastname'];
    this.gender = responseMap['gender'];
    this.phone = responseMap['phone'];
    this.token = responseMap['token'];
  }
}

class _LoginPageState extends State<LoginPage> {
  // final storage = new FlutterSecureStorage();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserData userData = new UserData();

  void login(email, password) async {
    final url = "http://10.0.2.2:8000/api/login/";
    await http.post(Uri.parse(url),
        body: {"email": email, "password": password}).then((response) {
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200) {
        userData.addData(responseMap);
        if (responseMap['is_admin'] == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminNav(userData),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(userData),
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
                            controller: emailController, hint: "Email Address"),
                        _passInput(
                            controller: passwordController, hint: "Password"),
                        SizedBox(height: 10),
                        Container(
                          child: Center(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             RegistrationPage()));
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
