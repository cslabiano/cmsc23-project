// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DonationDrive {
  String userId;
  String title;
  String description;
  String date;
  String imagePath;

  DonationDrive(
      {required this.userId,
      required this.title,
      required this.description,
      required this.date,
      required this.imagePath});

  factory DonationDrive.fromJson(Map<String, dynamic> json) {
    return DonationDrive(
        userId: json['userId'],
        title: json['title'],
        description: json['description'],
        date: json['date'],
        imagePath: json['imagePath']);
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
      'date': donationDrive.date,
      'imagePath': donationDrive.imagePath
    };
  }
}
