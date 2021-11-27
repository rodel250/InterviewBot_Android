class CreatedJobs {
  final int adminId;
  final String title;
  final String description;

  CreatedJobs({required this.adminId, required this.title, required this.description});

  factory CreatedJobs.fromJson(Map<String, dynamic> json) {
    return CreatedJobs(
        adminId: json['admin_id'], title: json['title'], description: json['description']);
  }

  Map<String, dynamic> toJson() =>
      {'admin_id': this.adminId, 'title': this.title, 'description': this.description};
}
