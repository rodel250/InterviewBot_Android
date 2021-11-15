class JobOfferings {
  final int id;
  final String title;
  final String description;

  JobOfferings(
      {required this.id, required this.title, required this.description});

  factory JobOfferings.fromJson(Map<String, dynamic> json) {
    return JobOfferings(
        id: json['id'], title: json['title'], description: json['description']);
  }

  Map<String, dynamic> toJson() =>
      {'id': this.id, 'title': this.title, 'description': this.description};
}
