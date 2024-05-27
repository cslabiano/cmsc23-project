import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAdminAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  // get all organizations, for admin
  Stream<QuerySnapshot> getAllOrganizationsAdmin() {
    return db.collection("organizations").snapshots();
  }

  // get all donors, for admin
  Stream<QuerySnapshot> getAllDonorsAdmin() {
    return db.collection("donors").snapshots();
  }

  // get all donations, for admin
  Stream<QuerySnapshot> getAllDonationsAdmin() {
    return db.collection("donations").snapshots();
  }

  // edit organization account status
  Future<String> editOrganizationAccountStatus(String id, String status) async {
    try {
      await db.collection("organizations").doc(id).update({ "accountStatus": status });
      return "Successfully edited organization account status!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }
}