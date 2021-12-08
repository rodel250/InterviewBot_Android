import 'package:interview_bot/model/accounts.dart';

class ViewApplicants {
  ViewApplicants({
    required this.finalScore,
    required this.user,
  });

  double finalScore;
  Account user;

  factory ViewApplicants.fromJson(Map<String, dynamic> json) => ViewApplicants(
        finalScore: json["final_score"].toDouble(),
        user: Account.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "final_score": finalScore,
        "user": user.toJson(),
      };
}
