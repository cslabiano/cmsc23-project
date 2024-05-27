import 'dart:convert';

class Org {
  final String usertype;
  final String email;
  final String orgname;
  final String uname;
  final String contact;
  final List<String> address;

  Org({
    required this.usertype,
    required this.email,
    required this.orgname,
    required this.uname,
    required this.contact,
    required this.address,
  });

  // Factory constructor to instantiate object from json format
  factory Org.fromJson(Map<String, dynamic> json) {
    return Org(
      usertype: json['usertype'],
      email: json['email'],
      orgname: json['orgname'],
      uname: json['uname'],
      contact: json['contact'],
      address: List<String>.from(json['address']),
    );
  }

  static List<Org> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Org>((dynamic d) => Org.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Org org) {
    return {
      'usertype': org.usertype,
      'email': org.email,
      'fname': org.orgname,
      'uname': org.uname,
      'contact': org.contact,
      'address': org.address,
    };
  }
}
