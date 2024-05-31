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

  //get all approved organizations
  Stream<QuerySnapshot> getAllDonor() {
    return db.collection('donors').snapshots();
  }

  Stream<QuerySnapshot> getDonations(String status) {
    return db
        .collection("donations")
        .where('status', isEqualTo: status)
        .snapshots();
  }

  Future<String> editVerification(String orgId) async {
    try {
      await db
          .collection("organizations")
          .doc(orgId)
          .update({"isVerified": true});
      return "Successfully approved organization!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}";
    }
  }
}
