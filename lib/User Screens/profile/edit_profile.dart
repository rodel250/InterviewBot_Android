import 'package:interview_bot/User%20Screens/aboutUs/aboutus_list_screen.dart';
import 'package:interview_bot/User%20Screens/contactUs/ContactUs.dart';
import 'package:interview_bot/User%20Screens/homePage/homePage.dart';
import 'package:interview_bot/User%20Screens/jobOffers/jobOfferings.dart';
import 'package:interview_bot/login_register/color.dart';
import 'package:interview_bot/login_register/loginpage.dart';
import 'package:interview_bot/login_register/splash_page.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final UserData userData;
  EditProfilePage(this.userData);

  @override
  _EditProfilePageState createState() => _EditProfilePageState(userData);
}

class _EditProfilePageState extends State<EditProfilePage> {
  final UserData userData;
  _EditProfilePageState(this.userData);

  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Personal Information\n",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: "assets/fonts/Gotham Bold"),
              ),
              buildTextField("Firstname:", "${userData.firstname}", false),
              buildTextField("Lastname", "${userData.lastname}", false),
              buildTextField("Phone number:", "${userData.phone}", false),
              buildTextField("Gender:", "${userData.gender}", false),
              Text(
                "Account Information\n",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: "assets/fonts/Gotham Bold"),
              ),
              buildTextField("Email Address:", "${userData.email}", false),
              buildTextField("Password:", "", true),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Color(0xFFFFCC00),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
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
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
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
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
