import 'package:kbti_app/models/definition.dart';

class User {
  late String username;
  late String email;
  late int totalApproved;
  late int totalReview;
  late int totalReject;
  late List<Map> definitions;

  User({
    required this.username,
    required this.email,
    required this.totalApproved,
    required this.totalReview,
    required this.totalReject,
    required this.definitions,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      totalApproved: json['total_approved'],
      totalReview: json['total_review'],
      totalReject: json['total_reject'],
      definitions: json['definitions'],
    );
  }
}
