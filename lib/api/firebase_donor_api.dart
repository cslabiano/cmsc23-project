import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/models/donor_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDonorAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getDonors() {
    return db.collection("donors").snapshots();
  }

  Stream<QuerySnapshot> getDonor(String? email) {
    return db.collection("donors").where("email", isEqualTo: email).snapshots();
  }

  Future<Donor?> getDetails(User user) async {
    try {
      DocumentSnapshot doc = await db.collection("donors").doc(user.uid).get();
      if (doc.exists) {
        return Donor.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
