class FewAccountDetails {
  FewAccountDetails({
    required this.email,
    required this.firstname,
    required this.lastname,
  });

  String email;
  String firstname;
  String lastname;

  factory FewAccountDetails.fromJson(Map<String, dynamic> json) =>
      FewAccountDetails(
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
