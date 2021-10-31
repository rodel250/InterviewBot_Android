import 'package:flutter/material.dart';
import 'package:interview_bot/widgets/button.dart';
import 'color.dart';
import 'loginpage.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.only(bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
                Container(
                height: MediaQuery.of(context).size.height*0.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [maroon,maroon],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset("assets/images/logo2.png", width: 200, height: 350),
                    ),
                  ],
                ),
              ),

              Container(
                //flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left:30, right: 30, top: 10, bottom: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      _textInput(hint: "First Name"),
                      _textInput(hint: "Last Name"),
                      _textInput(hint: "Phone Number"),
                      _textInput(hint: "Gender"),
                      _textInput(hint: "Email Address"),
                      _textInput(hint: "Password"),
                      _textInput(hint: "Confirm Password"),

                      SizedBox(height: 20),

                      Container(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>LoginPage()));
                              },
                              child: MaroonButton(
                                btnText: "REGISTER",
                                onClick: (){
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),

                      Container(
                        child: Center(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)=>LoginPage()));
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
                                    "GO BACK TO LOGIN",
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
      height: 40,
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
