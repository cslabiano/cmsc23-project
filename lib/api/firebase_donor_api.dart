import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDonorAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getDonors() {
    return db.collection("donors").snapshots();
  }

  Stream<QuerySnapshot> getDonor(String? email) {
    return db.collection("donors").where("email", isEqualTo: email).snapshots();
  }
}
