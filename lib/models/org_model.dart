import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Org {
  final String? orgId;
  final String usertype;
  final String email;
  final String orgname;
  final String uname;
  final String contact;
  final List<String> address;
  final bool isVerified;
  final bool isOpen;

  Org(
      {this.orgId,
      required this.usertype,
      required this.email,
      required this.orgname,
      required this.uname,
      required this.contact,
      required this.address,
      required this.isVerified,
      required this.isOpen});

  // Factory constructor to instantiate object from Firestore document
  factory Org.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Org(
      orgId: data['orgId'],
      usertype: 'org',
      email: data['email'],
      orgname: data['orgname'],
      uname: data['uname'],
      contact: data['contact'],
      address: List<String>.from(data['address']),
      isVerified: data['isVerified'],
      isOpen: data['isOpen'],
    );
  }

  // Factory constructor to instantiate object from json format
  factory Org.fromJson(Map<String, dynamic> json) {
    return Org(
      orgId: json['orgId'],
      usertype: json['usertype'],
      email: json['email'],
      orgname: json['orgname'],
      uname: json['uname'],
      contact: json['contact'],
      address: List<String>.from(json['address']),
      isVerified: json['isVerified'],
      isOpen: json['isOpen'],
    );
  }

  static List<Org> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Org>((dynamic d) => Org.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Org org) {
    return {
      'orgId': org.orgId,
      'usertype': org.usertype,
      'email': org.email,
      'fname': org.orgname,
      'uname': org.uname,
      'contact': org.contact,
      'address': org.address,
      'isVerified': org.isVerified,
      'isOpen': org.isOpen
    };
  }
}
