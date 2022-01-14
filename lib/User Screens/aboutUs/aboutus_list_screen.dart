import 'package:interview_bot/model/AboutUs.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'aboutus_details_screen.dart';

class AboutusListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: ListView.builder(
              itemCount: aboutusList.length,
              itemBuilder: (context, index) {
                AboutUs aboutUs = aboutusList[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(colors: [
                          Colors.yellow.shade700,
                          Colors.yellow.shade300
                        ]),
                      ),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            aboutUs.title,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Gotham",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        leading: Image.asset(aboutUs.imageUrl2),
                        trailing: Icon(
                          Icons.navigate_next,
                          size: 24,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AboutusDetailsScreen(aboutUs)));
                        },
                      ),
                    ),
                  ),
                );
              }),
        ),
        onWillPop: () => Future.value(false));
  }
}
