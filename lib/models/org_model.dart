import 'dart:convert';

class Org {
  final String? orgId;
  final String usertype;
  final String email;
  final String orgname;
  final String uname;
  final String imageProofPath;
  final String contact;
  final List<String> address;
  final bool isVerified;
  final bool isOpen;
  final String description;

  Org(
      {this.orgId,
      required this.usertype,
      required this.email,
      required this.orgname,
      required this.uname,
      required this.imageProofPath,
      required this.contact,
      required this.address,
      required this.isVerified,
      required this.isOpen,
      required this.description});

  // Factory constructor to instantiate object from json format
  factory Org.fromJson(Map<String, dynamic> json) {
    print("%%%%%%%%%%%%%%%%%%%%%%5\nmodel");
    print(json);
    return Org(
        orgId: json['orgId'],
        usertype: 'org',
        email: json['email'],
        orgname: json['orgname'],
        uname: json['uname'],
        imageProofPath: json['imageProofPath'],
        contact: json['contact'],
        address: List<String>.from(json['address']),
        isVerified: json['isVerified'],
        isOpen: json['isOpen'],
        description: json['description']);
  }

  static List<Org> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Org>((dynamic d) => Org.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Org org) {
    print("==============%%%%%%%%%%%%%%%%%%%%%%%%%%%=====================");
    print(org.isVerified);
    return {
      'orgId': org.orgId,
      'usertype': org.usertype,
      'email': org.email,
      'fname': org.orgname,
      'uname': org.uname,
      'imageProofPath': org.imageProofPath,
      'contact': org.contact,
      'address': org.address,
      'isVerified': org.isVerified,
      'isOpen': org.isOpen,
      'description': org.description
    };
  }
}
