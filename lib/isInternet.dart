import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget isInternet(String text,bool status){
  if(status == false){
    return Container(
      padding: EdgeInsets.all(10.00),
      margin: EdgeInsets.only(bottom: 10.00),
      color: Colors.red,
      child: Row(children: [

        Container(
          margin: EdgeInsets.only(right:6.00),
          child: Icon(Icons.info, color: Colors.white),
        ),
        Text(text, style: TextStyle(color: Colors.white)),
      ]),
    );
  }else{
    return Container();
  }
}