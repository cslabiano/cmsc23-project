import 'dart:convert';

class Donation {
  String userId;
  String donorName;
  String? id;
  String orgId;
  String? imagePath;
  String? address;
  String? contactNumber;
  String? donationDriveId;
  String status;
  List<String> itemType;
  String modeOfDelivery;
  String weight;
  String dateTime;

  Donation(
      {required this.userId,
      required this.donorName,
      this.id,
      required this.orgId,
      this.imagePath,
      this.address,
      this.contactNumber,
      this.donationDriveId,
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
        imagePath: json['imagePath'],
        address: json['address'],
        contactNumber: json['contactNumber'],
        donationDriveId: json['donationDriveId'],
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
      'imagePath': donation.imagePath,
      'address': address,
      'contactNumber': contactNumber,
      'donationDriveId': donation.donationDriveId,
      'status': donation.status,
      'itemType': donation.itemType,
      'modeOfDelivery': donation.modeOfDelivery,
      'weight': donation.weight,
      'dateTime': donation.dateTime,
    };
  }
}
