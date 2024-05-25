import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDonationAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> addDonation(Map<String, dynamic> donation) async {
    try {
      DocumentReference docRef = db.collection("donations").doc();

      donation['id'] = docRef.id;

      await docRef.set(donation);

      return "Successfully added!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }

  Stream<QuerySnapshot> getDonations(String? orgId) {
    return db
        .collection("donations")
        .where('orgId', isEqualTo: orgId)
        .snapshots();
  }

  Stream<QuerySnapshot> getDonation(String? id) {
    return db.collection("donations").where('id', isEqualTo: id).snapshots();
  }

  Future<String> changeStatus(String id, String status) async {
    try {
      await db.collection("donations").doc(id).update({"status": status});

      return "Status successfully changed!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }
}
