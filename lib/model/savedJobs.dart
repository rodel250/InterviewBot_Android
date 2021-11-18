class SavedJobs {
  final int id;
  final String title;
  final String description;

  SavedJobs({required this.id, required this.title, required this.description});

  factory SavedJobs.fromJson(Map<String, dynamic> json) {
    return SavedJobs(
        id: json['id'], title: json['title'], description: json['description']);
  }

  Map<String, dynamic> toJson() =>
      {'id': this.id, 'title': this.title, 'description': this.description};
}
