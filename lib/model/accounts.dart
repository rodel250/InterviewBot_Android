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
