import 'package:interview_bot/model/AboutUs.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'aboutus_details_screen.dart';

class AboutusListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: aboutusList.length,
          itemBuilder: (context, index) {
            AboutUs aboutUs = aboutusList[index];
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Card(
                color: Color(0xFF8C383E),
                elevation: 5,
                child: Container(
                  height: 80,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        aboutUs.title,
                        style: TextStyle(fontSize: 18, fontFamily: "Gotham",color: Colors.white),
                      ),
                    ),
                    leading: Image.network(aboutUs.imageUrl2),
                    trailing: Icon(Icons.arrow_forward_rounded),
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
    );
  }
}
