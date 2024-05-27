// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DonationDrive {
  String userId;
  String title;
  String description;
  String dateTime;

  DonationDrive({
    required this.userId,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  factory DonationDrive.fromJson(Map<String, dynamic> json) {
    return DonationDrive(
        userId: json['userId'],
        title: json['title'],
        description: json['description'],
        dateTime: json['dateTime']);
  }

  static List<DonationDrive> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data
        .map<DonationDrive>((dynamic d) => DonationDrive.fromJson(d))
        .toList();
  }

  Map<String, dynamic> toJson(DonationDrive donationDrive) {
    return {
      'userId': donationDrive.userId,
      'title': donationDrive.title,
      'description': donationDrive.description,
      'dateTime': donationDrive.dateTime
    };
  }
}
