import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAdminAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  //get all organizations for approval
  Stream<QuerySnapshot> getAllApproval() {
    return db
        .collection('organizations')
        .where('isVerified', isEqualTo: false)
        .snapshots();
  }

  // get all organizations
  Stream<QuerySnapshot> getAllOrganizations() {
    return db
        .collection("organizations")
        .where("isVerified", isEqualTo: true)
        .snapshots();
  }

  Stream<QuerySnapshot> getAllDonors(String status) {
    return db
        .collection("donations")
        .where('status', isEqualTo: status)
        .snapshots();
  }

  // get all donations, for admin
  Stream<QuerySnapshot> getAllDonations() {
    return db.collection("donations").snapshots();
  }

  // edit organization account status
  Future<String> editOrganizationAccountStatus(String id, String status) async {
    try {
      await db
          .collection("organizations")
          .doc(id)
          .update({"accountStatus": status});
      return "Successfully edited organization account status!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }
}
