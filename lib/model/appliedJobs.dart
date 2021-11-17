class AppliedJobs {
  final double finalScore;
  final Job job;

  AppliedJobs({required this.finalScore, required this.job});

  factory AppliedJobs.fromJson(Map<String, dynamic> json) {
    return AppliedJobs(
        finalScore: json['final_score'], job: new Job.fromJson(json['job']));
  }

  Map<String, dynamic> toJson() =>
      {'final_score': this.finalScore, 'job': this.job};
}

class Job {
  final String title;
  final String description;

  Job({required this.title, required this.description});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(title: json['title'], description: json['description']);
  }

  Map<String, dynamic> toJson() =>
      {'title': this.title, 'description': this.description};
}
