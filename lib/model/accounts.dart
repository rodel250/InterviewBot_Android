import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Account> createAccount(
    String email,
    dynamic isActive,
    dynamic staff,
    dynamic admin,
    String firstname,
    String lastname,
    String phone,
    String password,
    String? gender) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8000/api/account/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'email': email,
      'is_active': isActive,
      'staff': staff,
      'admin': admin,
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
      'password': password,
      'gender': gender,
    }),
  );

  if (response.statusCode == 201) {
    return Account.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create account.');
  }
}

class Account {
  final String email;
  final dynamic isActive;
  final dynamic staff;
  final dynamic admin;
  final String firstname;
  final String lastname;
  final String phone;
  final String password;
  final String? gender;

  Account({
    required this.email,
    required this.isActive,
    required this.staff,
    required this.admin,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.password,
    required this.gender,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      email: json['email'],
      isActive: json['is_active'],
      staff: json['staff'],
      admin: json['admin'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phone: json['phone'],
      password: json['password'],
      gender: json['gender'],
    );
  }
}
