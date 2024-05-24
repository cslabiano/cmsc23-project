class Donation {
  String category;
  bool forPickup; // true if for pickup, false if for drop-off
  double weight;
  String status;
  // photo; // optional, di ko alam dapat na data type
  // DateTime dateTime;
  String donorName;
  String? address; // only for pickup
  String? contactNo; // only for pickup

  Donation(
      {required this.category,
      required this.forPickup,
      required this.weight,
      required this.status,
      required this.donorName,
      this.address,
      this.contactNo});
}
