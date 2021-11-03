import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/Admin/nav.dart';
import 'package:interview_bot/login_register/registrationpage.dart';
import 'package:interview_bot/model/accounts.dart';
import 'package:interview_bot/user_nav.dart';
import 'package:interview_bot/widgets/button.dart';
import 'package:interview_bot/widgets/header.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<Account> users = [];
  getUserData() async {
    var response = await http.get(Uri.http("10.0.2.2:8000", "/api/account/"));
    var jsonData = jsonDecode(response.body);
    List<Account> users = [];
    for (var u in jsonData) {
      Account user = Account(
          email: u["email"],
          isActive: u["is_active"],
          staff: u["staff"],
          admin: u["admin"],
          firstname: u["firstname"],
          lastname: u["lastname"],
          phone: u["phone"],
          password: u["password"],
          gender: u["gender"]);
      users.add(user);
    }
    this.users = [...users];
    return users;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      _emailInput(hint: "Email Address"),
                      _passInput(hint: "Password"),
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
                                getUserData();
                                if (emailController.text == "" ||
                                    passwordController.text == "") {
                                  print("fill all the blanks!");
                                } else
                                  for (int i = 0; i < users.length; i++) {
                                    if (emailController.text ==
                                            users[i].email &&
                                        passwordController.text ==
                                            users[i].password) {
                                      if (users[i].admin == true &&
                                          users[i].isActive == true) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AdminNav()));
                                      } else if (users[i].isActive == true)
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserNav()));
                                    } else
                                      print("Login Failed!");
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
              )
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
