import 'dart:convert';

class Donation {
  String userId;
  String? id;
  String? orgId;
  String status;
  List<String> itemType;
  String modeOfDelivery;
  String weight;
  String dateTime;

  Donation(
      {required this.userId,
      this.id,
      this.orgId,
      required this.status,
      required this.itemType,
      required this.modeOfDelivery,
      required this.weight,
      required this.dateTime});

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
        userId: json['userId'],
        id: json['id'],
        status: json['status'],
        itemType: json['itemType'],
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
      'id': donation.id,
      'status': donation.status,
      'itemType': donation.itemType,
      'modeOfDelivery': donation.modeOfDelivery,
      'weight': donation.weight,
      'dateTime': donation.dateTime,
    };
  }
}
