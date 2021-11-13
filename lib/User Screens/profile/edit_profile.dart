import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:interview_bot/User%20Screens/aboutUs/aboutus_list_screen.dart';
import 'package:interview_bot/User%20Screens/contactUs/ContactUs.dart';
import 'package:interview_bot/User%20Screens/homePage/homePage.dart';
import 'package:interview_bot/User%20Screens/jobOffers/jobOfferings.dart';
import 'package:interview_bot/login_register/color.dart';
import 'package:interview_bot/login_register/loginpage.dart';
import 'package:interview_bot/login_register/registrationpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview_bot/login_register/splash_page.dart';

class EditProfilePage extends StatefulWidget {
  final UserData userData;
  EditProfilePage(this.userData);

  @override
  _EditProfilePageState createState() => _EditProfilePageState(userData);
}

class _EditProfilePageState extends State<EditProfilePage>
    with InputValidationMixin {
  final UserData userData;
  _EditProfilePageState(this.userData);
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
    emailController = new TextEditingController(text: '${userData.email}');
    firstnameController =
        new TextEditingController(text: '${userData.firstname}');
    lastnameController =
        new TextEditingController(text: '${userData.lastname}');
    phoneController = new TextEditingController(text: '${userData.phone}');
  }

  void save(id, firstname, lastname, phone, password) async {
    final url = "http://10.0.2.2:8000/api/update-account/";
    await http.post(Uri.parse(url), body: {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
      'password': password
    }).then((response) {
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200) {
        userData.firstname = firstname;
        userData.lastname = lastname;
        userData.phone = phone;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditProfilePage(userData),
          ),
        );
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

  void logout(key) async {
    final url = "http://10.0.2.2:8000/api/logout/";
    await http.post(Uri.parse(url), body: {'key': key}).then((response) {
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SplashPage(),
          ),
        );
        showDialog(
            context: context,
            builder: (BuildContext context) => getAlertDialog(
                "SUCCESS", '${responseMap["success"]}', context));
      } else {
        if (responseMap.containsKey("detail"))
          showDialog(
              context: context,
              builder: (BuildContext context) => getAlertDialog(
                  "Logout failed", '${responseMap["detail"]}', context));
      }
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              getAlertDialog("Logout failed", '${err.toString()}', context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 50, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      logout("${userData.token}");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFCC00),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      elevation: 2,
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
              Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            fontFamily: "assets/fonts/Gotham Bold"),
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
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            fontFamily: "assets/fonts/Gotham Bold"),
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
                        height: 10,
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
                                    "${userData.id}",
                                    firstnameController.text,
                                    lastnameController.text,
                                    phoneController.text,
                                    passwordController.text);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFFCC00),
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: Text(
                              "SAVE",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.white),
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
      persistentFooterButtons: [
        Column(
          children: [
            Flexible(
              child: Wrap(
                spacing: 7.0,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(userData)));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Icon(Icons.home),
                        new Text('Home'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Master(userData)));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Icon(Icons.search),
                        new Text('Job Offers'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AboutusListScreen(userData)));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Icon(Icons.info),
                        new Text('About Us'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactUs(userData)));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Icon(Icons.message),
                        new Text('Contact Us'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: maroon,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    onPressed: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Icon(Icons.person),
                        new Text('Me'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
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
