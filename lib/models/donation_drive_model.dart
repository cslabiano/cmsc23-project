class DonationDrive {
  String userId;
  String title;
  String description;
  String status;

  DonationDrive({
    required this.userId,
    required this.title,
    required this.description,
    required this.status
  });

  Map<String, dynamic> toJson(DonationDrive donationDrive) {
    return {
      'userId': donationDrive.userId,
      'title': donationDrive.title,
      'description': donationDrive.description,
      'status': donationDrive.status,
    };
  }

  factory DonationDrive.fromJson(Map<String, dynamic> json) {
    return DonationDrive(
      userId: json['userId'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
    );
  }
}
