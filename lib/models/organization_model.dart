import 'dart:convert';

class Organization {
  String uname;
  String orgname;
  String email;
  String contact;
  List<String> address;
  String accountStatus;
  String donationStatus;

  Organization(
      {required this.uname,
      required this.orgname,
      required this.email,
      required this.contact,
      required this.address,
      required this.accountStatus,
      required this.donationStatus});

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      uname: json['uname'],
      orgname: json['orgname'],
      email: json['email'],
      contact: json['contact'],
      address: (json['address'] as List<dynamic>)
          .map((item) => item as String)
          .toList(),
      accountStatus: json['accountStatus'],
      donationStatus: json['accountStatus'],
    );
  }

  static List<Organization> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data
        .map<Organization>((dynamic d) => Organization.fromJson(d))
        .toList();
  }

  Map<String, dynamic> toJson(Organization organization) {
    return {
      'uname': organization.uname,
      'orgname': organization.orgname,
      'email': organization.email,
      'contact': organization.contact,
      'address': organization.address,
      'accountStatus': organization.accountStatus,
      'donationStatus': organization.donationStatus
    };
  }
}
