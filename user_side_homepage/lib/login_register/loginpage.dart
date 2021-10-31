
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Interviewbot/login_register/registrationpage.dart';
import 'package:Interviewbot/widgets/button.dart';
import 'package:Interviewbot/widgets/header.dart';

import 'color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  margin: EdgeInsets.only(left:30, right: 30, top: 10, bottom: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      _textInput(hint: "Email Address"),
                      _textInput(hint: "Password"),

                      SizedBox(height: 10),

                      Container(
                        child: Center(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)=>RegistrationPage()));
                                },
                                child: Container(
                                  //margin: EdgeInsets.only(top:10),
                                  width: 180,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [trans,trans],
                                        end: Alignment.centerLeft,
                                        begin: Alignment.centerRight),
                                    borderRadius:
                                    //BorderRadius.all(Radius.circular(100),
                                    BorderRadius.all(Radius.circular(20),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87),
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
                              onClick: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>RegistrationPage()));
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
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>RegistrationPage()));
                              },

                              child: Container(
                                //margin: EdgeInsets.only(top:10),
                                width: 180,
                                height: 40,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [trans,trans],
                                      end: Alignment.centerLeft,
                                      begin: Alignment.centerRight),
                                  borderRadius:
                                  //BorderRadius.all(Radius.circular(100),
                                  BorderRadius.all(Radius.circular(20),
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

  Widget _textInput({controller,hint}){
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: gold,
      ),
      //padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }

}
