import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_bot/create_job_initial.dart';
import 'package:interview_bot/services/onboarding_flow20.dart';

class CreateJob extends StatelessWidget {
  static MaterialPage page() => MaterialPage(child: CreateJob());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          context.flow<OnBoardingStages20>().update((next) => OnBoardingStages20.stage2);
        },
        backgroundColor: Color(0xFF8C383E),
      ),
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Create()));
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
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 1"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 2"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 3"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 4"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 5"
                    ),
                  ),
                ),
              ],
            )),
        ),
      ),
    );
  }
}

class CreateJob2 extends StatelessWidget {
  static MaterialPage page() => MaterialPage(child: CreateJob2());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: (){
            context.flow<OnBoardingStages20>().update((next) => OnBoardingStages20.stage3);
          },
          backgroundColor: Color(0xFF8C383E),
        ),
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            context.flow<OnBoardingStages20>().update((previus) => OnBoardingStages20.stage1);
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
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 6"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 7"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 8"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 9"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 10"
                    ),
                  ),
                ),
              ],
            )),
        ),
      ),
    );
  }
}

class CreateJob3 extends StatelessWidget {
  static MaterialPage page() => MaterialPage(child: CreateJob3());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: (){
            context.flow<OnBoardingStages20>().update((next) => OnBoardingStages20.stage4);
          },
          backgroundColor: Color(0xFF8C383E),
        ),
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            context.flow<OnBoardingStages20>().update((previus) => OnBoardingStages20.stage2);
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
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 11"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 12"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 13"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 14"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 15"
                    ),
                  ),
                ),
              ],
            )),
        ),
      ),
    );
  }
}

class CreateJob4 extends StatelessWidget {
  static MaterialPage page() => MaterialPage(child: CreateJob4());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Builder(builder: (BuildContext context){
        return FloatingActionButton.extended(onPressed: (){
        },
          label: Text('Proceed'),
          icon: Icon(Icons.navigate_next),
          backgroundColor: Color(0xFF8C383E),);
      },),
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            context.flow<OnBoardingStages20>().update((previus) => OnBoardingStages20.stage3);
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
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 16"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 17"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 18"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 19"
                    ),
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Weight",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Question 20"
                    ),
                  ),
                ),
              ],
            )),
        ),
      ),
    );
  }
}