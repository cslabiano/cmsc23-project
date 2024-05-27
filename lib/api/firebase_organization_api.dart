import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseOrganizationAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  // get all organizations that accepts donations
  Stream<QuerySnapshot> getAllOrganizations() {
    return db.collection("organizations").where("donationStatus", isEqualTo: "Open").snapshots();
  }

  // get all donations to an organization
  Stream<QuerySnapshot> getDonationsToOrganization(String userId) {
    return db.collection("donations").where("orgId", isEqualTo: userId).snapshots();
  }

  // create an organization
  Future<String> addOrganization(organization) async {
    try {
      await db.collection("organizations").add(organization);
      return "Successfully added organization!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }

  // edit organization donation status
  Future<String> editOrganizationDonationStatus(String id, String status) async {
    try {
      await db.collection("organizations").doc(id).update({ "donationStatus": status });
      return "Successfully edited organization donation status!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }
}