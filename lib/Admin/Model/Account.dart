import 'package:flutter/cupertino.dart';

class Account{
  final String email;
  final bool isActive;
  final bool staff;
  final bool admin;
  final String firstname;
  final String lastname;
  final String phone;
  final String password;
  final String gender;

  Account(this.email, this.isActive, this.staff, this.admin, this.firstname,
      this.lastname, this.phone, this.password, this.gender);
}