class CreatedJobs {
  int id;
  int adminId;
  String title;
  String description;

  CreatedJobs(
      {required this.id,
      required this.adminId,
      required this.title,
      required this.description});

  factory CreatedJobs.fromJson(Map<String, dynamic> json) {
    return CreatedJobs(
        id: json['id'],
        adminId: json['admin_id'],
        title: json['title'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'admin_id': this.adminId,
        'title': this.title,
        'description': this.description
      };
}
