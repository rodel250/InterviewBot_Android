class AppliedJobs {
  final int userId;
  final int jobId;
  final double finalScore;

  AppliedJobs(
      {required this.userId, required this.jobId, required this.finalScore});

  factory AppliedJobs.fromJson(Map<String, dynamic> json) {
    return AppliedJobs(
        userId: json['user_id'],
        jobId: json['job_id'],
        finalScore: json['final_score']);
  }

  Map<String, dynamic> toJson() => {
        'user_id': this.userId,
        'job_id': this.jobId,
        'final_score': this.finalScore,
      };
}
