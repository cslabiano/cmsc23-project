// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DonationDrive {
  String userId;
  String title;
  String description;
  String status;
  
  DonationDrive({
    required this.userId,
    required this.title,
    required this.description,
    required this.status,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'title': title,
      'description': description,
      'status': status,
    };
  }

  factory DonationDrive.fromMap(Map<String, dynamic> map) {
    return DonationDrive(
      userId: map['userId'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      status: map['status'] as String,
    );
  }

  String toJson(DonationDrive donationDrive) => json.encode(toMap());

  factory DonationDrive.fromJson(String source) => DonationDrive.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DonationDrive(userId: $userId, title: $title, description: $description, status: $status)';
  }
}
