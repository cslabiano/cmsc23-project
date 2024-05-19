// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/models/donation_drive_model.dart';

class FirebaseDonationDriveAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  // get all donation drives
  Stream<QuerySnapshot> getAllDonationDrives() {
    return db.collection("donationDrives").snapshots();
  }

  // get a donation drive
  Future<DonationDrive?> getDonationDrive(String id) async {
    try {
      DocumentSnapshot snapshot = await db.collection("donationDrives").doc(id).get();
      return DonationDrive.fromJson(snapshot.data as Map<String, dynamic>);
    } on FirebaseException catch (e) {
      print("Error in ${e.code}: ${e.message}");
      return null;
    }
    
  }

  // create a donation drive
  Future<String> addDonationDrive(Map<String, dynamic> donationDrive) async {
    try {
      await db.collection("donationDrives").add(donationDrive);
      return "Successfully added donation drive!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }

  // update a donation drive
  Future<String> editDonationDrive(String id, String title, String description, bool status) async {
    try {
      await db.collection("donationDrives").doc(id).update({"title": title, "description": description, "status": status});
      return "Successfully edited donation drive!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }

  // delete a donation drive
  Future<String> deleteDonationDrive(String id) async {
    try {
      await db.collection("donationDrives").doc(id).delete();
      return "Successfully deleted donation drive!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }
}
