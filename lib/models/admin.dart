import 'dart:convert';

class Admin {
  final String usertype;
  final String email;
  final String uname;
  final String name;

  Admin(
      {required this.usertype,
      required this.email,
      required this.uname,
      required this.name});

  // Factory constructor to instantiate object from json format
  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      usertype: json['usertype'],
      email: json['email'],
      uname: json['uname'],
      name: json['name'],
    );
  }

  static List<Admin> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Admin>((dynamic d) => Admin.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Admin admin) {
    return {
      'usertype': admin.usertype,
      'email': admin.email,
      'uname': admin.uname,
      'name': admin.name,
    };
  }
}
