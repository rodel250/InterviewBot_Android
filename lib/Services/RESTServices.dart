import 'dart:convert';

import 'package:interview_bot/Services/Storage.dart';
import 'package:interview_bot/login_register/loginpage.dart';
import 'package:interview_bot/model/accounts.dart';
import 'package:interview_bot/model/fewAccountDetails.dart';
import 'package:interview_bot/model/viewApplicants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:interview_bot/model/appliedJobs.dart';
import 'package:interview_bot/model/jobOfferings.dart';
import 'package:interview_bot/model/savedJobs.dart';
import 'package:interview_bot/User%20Screens/user_nav.dart';
import 'package:interview_bot/login_register/splash_page.dart';
import 'package:interview_bot/model/createdJobs.dart';

const String BASE_URL = "https://citu-interviewbot.herokuapp.com/api/";
const String LOGIN = "login/";
const String LOGOUT = "logout/";
const String UPDATE_ACCOUNT = "update-account/";
const String SAVE_JOB = "saved-jobs/create/";
const String SAVED_JOB_DETAILS = "/saved-jobs/details/";
const String APPLIED_JOB_DETAILS = "/applied-jobs/details/";
const String JOB_OFFERINGS_DETAILS = "/job-offerings/details/";
const String GET_ALL_ACCOUNTS = "accounts/";
const String USER_REGISTRATION = "user-registration/";

const String ADMIN_JOB_OFFERING = "/job-offerings/";
const String ADMIN_VIEW_JOB_APPLICANTS = "applied-jobs/applicants/";

final SecureStorage secureStorage = SecureStorage();

AlertDialog getAlertDialog(title, content, context) {
  return AlertDialog(
    title: Text(title),
    content: Text(
      '$content',
      textAlign: TextAlign.center,
    ),
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

void toResetPasswordWebsite() async {
  const url = 'https://citu-interviewbot.herokuapp.com/password_reset/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void onNoSuchMethodError(context) {
  secureStorage.deleteAllSecureData();
  globals.selectedIndex = 0;
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  showDialog(
      context: context,
      builder: (BuildContext context) => getAlertDialog(
          "ERROR", "Invalid token. Please login again", context));
}

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
    Uri.parse(BASE_URL + USER_REGISTRATION),
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

Future<List<FewAccountDetails>> fetchAccounts() async {
  final url = BASE_URL + GET_ALL_ACCOUNTS;
  final response = await http.get(Uri.parse(url));
  final items = json.decode(response.body).cast<Map<String, dynamic>>();

  List<FewAccountDetails> accounts = items.map<FewAccountDetails>((json) {
    return FewAccountDetails.fromJson(json);
  }).toList();

  return accounts;
}

Future<int> fetchSavedJobs(context) async {
  final url = BASE_URL + finalUserId.toString() + SAVED_JOB_DETAILS;

  try {
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Token ' + finalToken!,
    });
    final responseMap = json
        .decode(utf8
            .decode(response.bodyBytes)) // utf8.decode for special characters
        .cast<Map<String, dynamic>>();
    if (response.statusCode == 200) {
      return responseMap.length;
    } else {
      throw Exception('Failed to load applied jobs');
    }
  } on NoSuchMethodError {
    onNoSuchMethodError(context);
  }

  return 0;
}

Future<int> fetchAppliedJobs(context) async {
  final url = BASE_URL + finalUserId.toString() + APPLIED_JOB_DETAILS;

  try {
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Token ' + finalToken!,
    });
    final responseMap = json
        .decode(utf8
            .decode(response.bodyBytes)) // utf8.decode for special characters
        .cast<Map<String, dynamic>>();
    if (response.statusCode == 200) {
      return responseMap.length;
    } else {
      throw Exception('Failed to load applied jobs');
    }
  } on NoSuchMethodError {
    onNoSuchMethodError(context);
  }

  return 0;
}

Future<List<AppliedJobs>> getAppliedJobsList(context) async {
  final url = BASE_URL + finalUserId.toString() + APPLIED_JOB_DETAILS;
  List<AppliedJobs> appliedJobs = [];

  try {
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Token ' + finalToken!,
    });
    final items = json
        .decode(utf8
            .decode(response.bodyBytes)) // utf8.decode for special characters
        .cast<Map<String, dynamic>>();

    appliedJobs = items.map<AppliedJobs>((json) {
      return AppliedJobs.fromJson(json);
    }).toList();
  } on NoSuchMethodError {
    onNoSuchMethodError(context);
  }

  return appliedJobs;
}

Future<List<SavedJobs>> getSavedJobsList(context) async {
  final url = BASE_URL + finalUserId.toString() + SAVED_JOB_DETAILS;
  List<SavedJobs> savedJobs = [];

  try {
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Token ' + finalToken!,
    });
    final items = json
        .decode(utf8
            .decode(response.bodyBytes)) // utf8.decode for special characters
        .cast<Map<String, dynamic>>();
    savedJobs = items.map<SavedJobs>((json) {
      return SavedJobs.fromJson(json);
    }).toList();
  } on NoSuchMethodError {
    onNoSuchMethodError(context);
  }

  return savedJobs;
}

Future<void> saveJobOffering(context, jobId) async {
  int count = await fetchSavedJobs(context);
  print("TOTAL SAVED JOBS: " + count.toString());
  if (count == 5) {
    showDialog(
        context: context,
        builder: (BuildContext context) => getAlertDialog("SAVE FAILED",
            'YOU CAN ONLY SAVE AT MOST 5 JOB OFFERINGS.', context));
  } else {
    final url = BASE_URL + SAVE_JOB;
    final response = await http.post(Uri.parse(url), body: {
      "user": finalUserId.toString(),
      "job": jobId.toString()
    }, headers: {
      'Authorization': 'Token ' + finalToken!,
    });
    if (response.statusCode == 201) {
      globals.selectedIndex = 1;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserNav()),
      );
    }
  }
}

Future<void> unsaveJobOffering(id, context) async {
  final url = BASE_URL + "saved-jobs/" + id + "/delete/";
  final response = await http.delete(Uri.parse(url), headers: {
    'Authorization': 'Token ' + finalToken!,
  });
  if (response.statusCode == 204) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => UserNav()));
  }
}

Future<List<JobOfferings>> getJobOfferingsList(context) async {
  final url = BASE_URL + finalUserId.toString() + JOB_OFFERINGS_DETAILS;
  List<JobOfferings> jobOfferings = [];

  try {
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Token ' + finalToken!,
    });

    final items = json
        .decode(utf8
            .decode(response.bodyBytes)) // utf8.decode for special characters
        .cast<Map<String, dynamic>>();

    jobOfferings = items.map<JobOfferings>((json) {
      return JobOfferings.fromJson(json);
    }).toList();
  } on NoSuchMethodError {
    onNoSuchMethodError(context);
  }

  return jobOfferings;
}

Future<List<CreatedJobs>> getAdminJobOfferings(context) async {
  final url = BASE_URL + "admin/" + finalUserId.toString() + ADMIN_JOB_OFFERING;
  List<CreatedJobs> createdJobs = [];

  try {
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Token ' + finalToken!,
    });

    final items = json
        .decode(utf8
            .decode(response.bodyBytes)) // utf8.decode for special characters
        .cast<Map<String, dynamic>>();

    createdJobs = items.map<CreatedJobs>((json) {
      return CreatedJobs.fromJson(json);
    }).toList();
  } on NoSuchMethodError {
    onNoSuchMethodError(context);
  }

  return createdJobs;
}

Future<List<ViewApplicants>> getJobApplicants(jobId, context) async {
  final url = BASE_URL + ADMIN_VIEW_JOB_APPLICANTS + jobId.toString() + "/";
  List<ViewApplicants> jobApplicants = [];

  try {
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Token ' + finalToken!,
    });

    final items = json.decode(
        utf8.decode(response.bodyBytes)); // utf8.decode for special characters

    jobApplicants = items.map<ViewApplicants>((json) {
      return ViewApplicants.fromJson(json);
    }).toList();
  } on NoSuchMethodError {
    onNoSuchMethodError(context);
  }

  return jobApplicants;
}

Future<bool> isJobApplicantsEmpty(id, context) async {
  List<ViewApplicants> jobApplicants = await getJobApplicants(id, context);
  if (jobApplicants.isEmpty) {
    return Future<bool>.value(true);
  }
  return Future<bool>.value(false);
}
