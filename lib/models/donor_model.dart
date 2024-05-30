import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Donor {
  final String? usertype;
  final String email;
  final String fname;
  final String lname;
  final String uname;
  final String contact;
  final List<String> address;

  Donor({
    this.usertype,
    required this.email,
    required this.fname,
    required this.lname,
    required this.uname,
    required this.contact,
    required this.address,
  });

  factory Donor.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Donor(
      usertype: 'donor',
      email: data['email'] ?? '',
      fname: data['fname'] ?? '',
      lname: data['lname'] ?? '',
      uname: data['uname'] ?? '',
      contact: data['contact'] ?? '',
      address:
          data['address'] != null ? List<String>.from(data['address']) : [],
    );
  }

  // Factory constructor to instantiate object from json format
  factory Donor.fromJson(Map<String, dynamic> json) {
    return Donor(
      email: json['email'],
      fname: json['fname'],
      lname: json['lname'],
      uname: json['uname'],
      contact: json['contact'],
      address: List<String>.from(json['address']),
    );
  }

  static List<Donor> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Donor>((dynamic d) => Donor.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Donor donor) {
    return {
      'usertype': donor.usertype,
      'email': donor.email,
      'fname': donor.fname,
      'lname': donor.lname,
      'uname': donor.uname,
      'contact': donor.contact,
      'address': donor.address,
    };
  }
}
