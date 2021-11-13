// import 'package:flutter/material.dart';
// import 'package:interview_bot/User%20Screens/aboutUs/aboutus_list_screen.dart';
// import 'package:interview_bot/User%20Screens/contactUs/ContactUs.dart';
// import 'package:interview_bot/User%20Screens/homePage/homePage.dart';
// import 'package:interview_bot/User%20Screens/jobOffers/data.dart';
// import 'package:interview_bot/User%20Screens/jobOffers/jobs.dart';
// import 'package:interview_bot/User%20Screens/profile/edit_profile.dart';
// import 'package:interview_bot/login_register/color.dart';
// import 'package:interview_bot/login_register/loginpage.dart';

// class Master extends StatefulWidget {
//   final UserData userData;
//   Master(this.userData);

//   @override
//   _MasterState createState() => _MasterState(userData);
// }

// class _MasterState extends State<Master> {
//   UserData userData;
//   _MasterState(this.userData);

//   List<NavigationItem> navigationItems = getNavigationItemList();
//   late NavigationItem selectedItem;

//   late Widget currentWidgetView;

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       selectedItem = navigationItems[0];
//       currentWidgetView = Jobs();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: AnimatedSwitcher(
//         duration: Duration(milliseconds: 300),
//         child: currentWidgetView,
//       ),
//       persistentFooterButtons: [
//         Column(
//           children: [
//             Flexible(
//               child: Wrap(
//                 spacing: 7.0,
//                 children: <Widget>[
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => HomePage(userData)));
//                     },
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         onPrimary: Colors.black,
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 5, vertical: 0),
//                         textStyle: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.normal)),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         new Icon(Icons.home),
//                         new Text('Home'),
//                       ],
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         onPrimary: maroon,
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 5, vertical: 0),
//                         textStyle: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold)),
//                     onPressed: () {},
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         new Icon(Icons.search),
//                         new Text('Job Offers'),
//                       ],
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         onPrimary: Colors.black,
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 5, vertical: 0),
//                         textStyle: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.normal)),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   AboutusListScreen(userData)));
//                     },
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         new Icon(Icons.info),
//                         new Text('About Us'),
//                       ],
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         onPrimary: Colors.black,
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 5, vertical: 0),
//                         textStyle: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.normal)),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ContactUs(userData)));
//                     },
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         new Icon(Icons.message),
//                         new Text('Contact Us'),
//                       ],
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         onPrimary: Colors.black,
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 5, vertical: 0),
//                         textStyle: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.normal)),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => EditProfilePage(userData)));
//                     },
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         new Icon(Icons.person),
//                         new Text('Me'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
