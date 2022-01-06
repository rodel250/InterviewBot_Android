class AppliedJobIds {
  AppliedJobIds({
    required this.jobId,
    required this.finalScore,
  });

  int jobId;
  double finalScore;

  factory AppliedJobIds.fromJson(Map<String, dynamic> json) => AppliedJobIds(
        jobId: json["job_id"],
        finalScore: json["final_score"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "job_id": jobId,
        "final_score": finalScore,
      };
}
