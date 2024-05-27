import 'dart:convert';

class Donation {
  String userId;
  String donorName;
  String? id;
  String? orgId;
  String? address;
  String? contactNumber;
  String status;
  List<String> itemType;
  String modeOfDelivery;
  String weight;
  String dateTime;

  Donation(
      {required this.userId,
      required this.donorName,
      this.id,
      this.orgId,
      this.address,
      this.contactNumber,
      required this.status,
      required this.itemType,
      required this.modeOfDelivery,
      required this.weight,
      required this.dateTime});

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
        userId: json['userId'],
        donorName: json['donorName'],
        id: json['id'],
        orgId: json['orgId'],
        address: json['address'],
        contactNumber: json['contactNumber'],
        status: json['status'],
        itemType: (json['itemType'] as List<dynamic>)
            .map((item) => item as String)
            .toList(),
        modeOfDelivery: json['modeOfDelivery'],
        weight: json['weight'],
        dateTime: json['dateTime']);
  }

  static List<Donation> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Donation>((dynamic d) => Donation.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Donation donation) {
    return {
      'userId': donation.userId,
      'donorName': donation.donorName,
      'id': donation.id,
      'orgId': donation.orgId,
      'address': address,
      'contactNumber': contactNumber,
      'status': donation.status,
      'itemType': donation.itemType,
      'modeOfDelivery': donation.modeOfDelivery,
      'weight': donation.weight,
      'dateTime': donation.dateTime,
    };
  }
}
