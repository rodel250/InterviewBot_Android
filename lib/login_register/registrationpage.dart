import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:interview_bot/model/accounts.dart';
import 'package:interview_bot/widgets/button.dart';

import 'color.dart';
import 'loginpage.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _password2 = TextEditingController();
  Future<Account>? _futureAccount;
  String? dropdownValue;

  // Future<Account> getAccountEmailAddress() async {

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.only(bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [maroon, maroon],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100)),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset("assets/images/logo2.png",
                          width: 200, height: 350),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  //flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 30, right: 30, top: 0, bottom: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: (_futureAccount == null)
                              ? buildColumn()
                              : buildFutureBuilder(),
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: Center(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
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
                                      "GO BACK TO LOGIN",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _textInput(controller: _firstname, hint: "First Name"),
        _textInput(controller: _lastname, hint: "Last Name"),
        _textInput(controller: _phone, hint: "Phone Number"),
        SizedBox(height: 10),
        Container(
          height: 50,
          width: 450,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(7),
          //padding: EdgeInsets.only(
          //  top: 10,
          //  left: 10,
          //  right: 10,
          //  bottom: 10,
          //),
          decoration: BoxDecoration(
            color: Color(0xFFFFCC00),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
                color: Color(0xFFFFCC00), style: BorderStyle.solid, width: 0.0),
          ),
          child: Center(
            child: DropdownButton<String>(
              value: dropdownValue,
              style: TextStyle(color: Colors.black, fontSize: 16),
              elevation: 16,
              hint: Center(
                  child: new Text(
                'Gender',
                textAlign: TextAlign.center,
              )),
              //icon: const Icon(Icons.arrow_drop_down_circle),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['Male', 'Female']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              underline: DropdownButtonHideUnderline(child: Container()),
              dropdownColor: Color(0xFFFFFFFF),
              iconEnabledColor: Color(0xFFFFFFFF),
              isExpanded: true,
            ),
          ),
        ),
        _textInput(controller: _email, hint: "Email Address"),
        Container(
          //margin: EdgeInsets.only(top: 7),
          height: 50,
          margin: EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: gold,
          ),
          child: TextFormField(
            controller: _password,
            obscureText: true,
            textAlign: TextAlign.center,
            // maxLength: 20,
            // maxLengthEnforcement:
            // MaxLengthEnforcement.truncateAfterCompositionEnds,
            validator: (val) {
              if (val!.isEmpty) {
                return '\t\t\tThis field is required';
              } else if (!(isPasswordValid(val))) {
                return '\t\t\tEnter a valid password';
              }
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Password",
              counterText: "",
              errorStyle: TextStyle(height: 1),
              hintStyle: TextStyle(height: 0),
            ),
          ),
        ),
        Container(
          //margin: EdgeInsets.only(top: 7),
          height: 50,
          margin: EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: gold,
          ),
          child: TextFormField(
            controller: _password2,
            obscureText: true,
            textAlign: TextAlign.center,
            validator: (val) {
              if (val!.isEmpty) {
                return '\t\t\tThis field is required';
              }

              if (val != _password.text) {
                return 'Password does not match';
              }
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Confirm Password",
              errorStyle: TextStyle(height: 1),
              hintStyle: TextStyle(height: 0),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
            child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: MaroonButton(
                btnText: "REGISTER",
                onClick: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _futureAccount = createAccount(
                              _email.text,
                              false,
                              false,
                              false,
                              _firstname.text,
                              _lastname.text,
                              _phone.text,
                              _password.text,
                              dropdownValue)
                          .then((value) {
                        throw Exception('Some arbitrary error');
                      }).catchError((onError) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => getAlertDialog(
                                "Registration Failed",
                                "Email address is already taken",
                                context));
                      });
                    });
                  }
                },
              ),
            ),
          ],
        )),
      ],
    );
  }

  FutureBuilder<Account> buildFutureBuilder() {
    return FutureBuilder<Account>(
      future: _futureAccount,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
              snapshot.data!.email +
                  " successfully registered.\n Please activate your account.",
              textAlign: TextAlign.center);
        } else if (snapshot.hasError) {
          return Text('REGISTRATION FAILED');
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _textInput({controller, hint}) {
    return Container(
      margin: EdgeInsets.all(7),
      height: 50,
      //padding: EdgeInsets.only(bottom: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: gold,
      ),
      //padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "\t\t\tThis field is required";
          }
          if (hint == "Email Address") {
            if (!(isEmailValid(value))) {
              return "\t\t\tEnter a valid email";
            }
          }
          if (hint == "Phone Number") {
            if (!(isPhoneValid(value))) {
              return "\t\t\tEnter a valid phone number";
            }
          }
          return null;
        },
        // maxLength: hint == "Phone Number" ? 11 : TextField.noMaxLength,
        controller: controller,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          errorStyle: TextStyle(height: 1),
          hintStyle: TextStyle(height: 0),
          //counterText: "",
        ),
      ),
    );
  }
}

mixin InputValidationMixin {
  bool isPasswordValid(String password) {
    password = password.trim();
    if (password.length > 5 && password.length < 21) {
      RegExp regex = new RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
      if (regex.hasMatch(password)) {
        return true;
      }
    }
    return false;
  }

  bool isEmailValid(String email) {
    RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

  bool isPhoneValid(String phone) {
    RegExp regex = new RegExp(r"^[0-9]{11}");
    return regex.hasMatch(phone);
  }
}