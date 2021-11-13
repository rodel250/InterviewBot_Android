class JobOfferings {
  final String title;
  final String description;

  JobOfferings({required this.title, required this.description});

  factory JobOfferings.fromJson(Map<String, dynamic> json) {
    return JobOfferings(title: json['title'], description: json['description']);
  }

  Map<String, dynamic> toJson() =>
      {'title': this.title, 'description': this.description};
}
