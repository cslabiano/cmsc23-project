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

  // get all organizations, for admin
  Stream<QuerySnapshot> getAllOrganizations() {
    return db
        .collection("organizations")
        .where('isVerified', isEqualTo: true)
        .snapshots();
  }

  // get all donors, for admin
  Stream<QuerySnapshot> getAllDonors() {
    return db.collection("donors").snapshots();
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
