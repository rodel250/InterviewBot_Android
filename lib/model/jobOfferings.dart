import 'dart:convert';

List<JobOfferings> jobOfferingsFromJson(String str) => List<JobOfferings>.from(
    json.decode(str).map((x) => JobOfferings.fromJson(x)));

String jobOfferingseToJson(List<JobOfferings> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobOfferings {
  JobOfferings({
    required this.id,
    required this.title,
    required this.description,
    required this.admin,
  });

  int id;
  String title;
  String description;
  Admin admin;

  factory JobOfferings.fromJson(Map<String, dynamic> json) => JobOfferings(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        admin: Admin.fromJson(json["admin"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "admin": admin.toJson(),
      };
}

class Admin {
  Admin({
    required this.email,
    required this.firstname,
    required this.lastname,
  });

  String email;
  String firstname;
  String lastname;

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        email: json["email"],
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
      };
}
