import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:interview_bot/Admin%20Screens/admin_nav.dart';
import 'package:interview_bot/Services/RESTServices.dart';

import 'package:interview_bot/Services/Storage.dart';
import 'package:interview_bot/User%20Screens/user_nav.dart';
import 'package:interview_bot/login_register/color.dart';
import 'package:interview_bot/login_register/registrationpage.dart';
import 'package:interview_bot/login_register/splash_page.dart';

import '../../Services/globals.dart' as globals;

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>
    with InputValidationMixin {
  final SecureStorage secureStorage = SecureStorage();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool showPassword = true;

  @override
  void initState() {
    super.initState();
    emailController = new TextEditingController(text: finalEmail);
    firstnameController = new TextEditingController(text: finalFirstName);
    lastnameController = new TextEditingController(text: finalLastName);
    phoneController = new TextEditingController(text: finalPhone);
  }

  void save(id, firstname, lastname, phone, password) async {
    final url = BASE_URL + UPDATE_ACCOUNT;
    await http.post(Uri.parse(url), headers: {
      'Authorization': 'Token ' + finalToken!,
    }, body: {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
      'password': password
    }).then((response) {
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200) {
        finalFirstName = firstname;
        finalLastName = lastname;
        finalPhone = phone;
        if (finalIsStaff == "true") {
          globals.selectedIndex = 2;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminNav(),
            ),
          );
        } else {
          globals.selectedIndex = 4;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserNav(),
            ),
          );
        }

        showDialog(
            context: context,
            builder: (BuildContext context) => getAlertDialog(
                "SUCCESS", '${responseMap["success"]}', context));
      } else {
        if (responseMap.containsKey("detail"))
          showDialog(
              context: context,
              builder: (BuildContext context) => getAlertDialog(
                  "Save failed", '${responseMap["detail"]}', context));
      }
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              getAlertDialog("Save failed", '${err.toString()}', context));
    });
  }

  void logout() async {
    secureStorage.deleteAllSecureData();
    globals.selectedIndex = 0;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SplashPage(),
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) =>
            getAlertDialog("SUCCESS", 'Successfully logged out', context));

    // final url = BASE_URL + LOGOUT;
    // await http.post(Uri.parse(url), body: {
    //   'key': finalToken
    // }, headers: {
    //   'Authorization': 'Token ' + finalToken!,
    // }).then((response) {
    //   Map<String, dynamic> responseMap = json.decode(response.body);
    //   if (response.statusCode == 200) {
    //     secureStorage.deleteAllSecureData();
    //     globals.selectedIndex = 0;
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => SplashPage(),
    //       ),
    //     );
    //     showDialog(
    //         context: context,
    //         builder: (BuildContext context) => getAlertDialog(
    //             "SUCCESS", '${responseMap["success"]}', context));
    //   } else {
    //     if (responseMap.containsKey("detail"))
    //       showDialog(
    //           context: context,
    //           builder: (BuildContext context) => getAlertDialog(
    //               "Logout failed", '${responseMap["detail"]}', context));
    //   }
    // }).catchError((err) {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) =>
    //           getAlertDialog("Logout failed", '${err.toString()}', context));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: 30,
          top: 30,
          right: 30,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      logout();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: maroon,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Icon(Icons.logout),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                            color: Color(0xFF8C383E),
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            fontFamily: "assets/fonts/Gotham Bold"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      buildTextField(
                          controller: firstnameController,
                          labelText: "First Name:",
                          editable: true,
                          isPasswordTextField: false),
                      buildTextField(
                          controller: lastnameController,
                          labelText: "Last Name",
                          editable: true,
                          isPasswordTextField: false),
                      buildTextField(
                          controller: phoneController,
                          labelText: "Phone",
                          editable: true,
                          isPasswordTextField: false),
                      Text(
                        "\nAccount Information",
                        style: TextStyle(
                            color: Color(0xFF8C383E),
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            fontFamily: "assets/fonts/Gotham Bold"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      buildTextField(
                          controller: emailController,
                          labelText: "Email Address",
                          editable: false,
                          isPasswordTextField: false),
                      buildTextField(
                          controller: passwordController,
                          labelText: "Password",
                          editable: true,
                          isPasswordTextField: true),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                save(
                                    finalUserId,
                                    firstnameController.text,
                                    lastnameController.text,
                                    phoneController.text,
                                    passwordController.text);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: gold,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 40),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            child: Text(
                              "SAVE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.2,
                                  color: Colors.black54),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      {controller, labelText, editable, isPasswordTextField}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        controller: controller,
        enabled: editable,
        maxLength: labelText == "Phone" ? 11 : TextField.noMaxLength,
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        obscureText: isPasswordTextField ? showPassword : false,
        validator: (value) {
          if (labelText != "Password") {
            if ((value == null || value.isEmpty)) {
              return '\t\t\tThis field is required';
            }

            if (labelText == "Phone" && !(isPhoneValid(value))) {
              return "\t\t\tEnter a valid phone";
            }
          } else if (labelText == "Password" &&
              !(isPasswordValid(value!)) &&
              value.isNotEmpty) {
            return "\t\t\tEnter a valid password";
          }

          return null;
        },
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3, top: 15),
            labelText: labelText,
            counterText: "",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  AlertDialog getAlertDialog(title, content, context) {
    return AlertDialog(
      title: Text('$title'),
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
}
