import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/nav.dart';
import 'package:interview_bot/services/onboarding_flow10.dart';
import 'package:interview_bot/services/onboarding_flow15.dart';
import 'package:interview_bot/services/onboarding_flow20.dart';
import 'package:interview_bot/services/onboarding_flow5.dart';

class Create extends StatefulWidget {
  @override
  CreateJobInitial createState() => CreateJobInitial();
}

class CreateJobInitial extends State<Create> {

  final items = ['5 Questions', '10 Questions', '15 Questions', '20 Questions'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () async {
          if(value == '10 Questions'){
            await Navigator.of(context).push(OnBoardingFlow10.route(),);
          }
          else if(value == '15 Questions'){
            await Navigator.of(context).push(OnBoardingFlow15.route(),);
          }
          else if(value == '20 Questions'){
            await Navigator.of(context).push(OnBoardingFlow20.route(),);
          }
          else if(value == '5 Questions'){
            await Navigator.of(context).push(OnBoardingFlow5.route(),);
          }else{}
        },
        backgroundColor: Color(0xFF8C383E),
      ),
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Nav()));
          },
        ),
        title: Text("Create Job"),
        backgroundColor: Color(0xFF8C383E),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    labelText: "Job Title"
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0),
                    child: TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                        labelText: "Description"
                      ),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: DropdownButton<String>(
                        value: value,
                        hint: new Text('Questions'),
                        isExpanded: true,
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(() => this.value = value),
                      ),
                    ),
                ),
              ],
            )),
        ),
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
    ),
    );
}