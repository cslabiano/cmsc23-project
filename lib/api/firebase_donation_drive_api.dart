import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDonationDriveAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  // get all donation drives
  Stream<QuerySnapshot> getAllDonationDrives() {
    return db.collection("donationDrives").snapshots();
  }

  // 
}

