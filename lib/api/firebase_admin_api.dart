import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAdminAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  //get all organizations for approval
  Stream<QuerySnapshot> getUnverified() {
    return db
        .collection('organizations')
        .where('isVerified', isEqualTo: false)
        .snapshots();
  }

  //get all approved organizations
  Stream<QuerySnapshot> getVerified() {
    return db
        .collection('organizations')
        .where('isVerified', isEqualTo: true)
        .snapshots();
  }

  Stream<QuerySnapshot> getDonations(String status) {
    return db
        .collection("donations")
        .where('status', isEqualTo: status)
        .snapshots();
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
