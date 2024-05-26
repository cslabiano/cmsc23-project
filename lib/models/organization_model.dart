class Organization {
  String uname;
  String orgname;
  String email;
  String contact;
  List<String> address;
  String accountStatus;
  String donationStatus;

  Organization({
    required this.uname,
    required this.orgname,
    required this.email,
    required this.contact,
    required this.address,
    required this.accountStatus,
    required this.donationStatus
  });
}