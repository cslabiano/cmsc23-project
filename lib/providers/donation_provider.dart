// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/api/firebase_donation_api.dart';
import 'package:flutter/material.dart';
import '/models/donor_donation_model.dart';

class DonationProvider with ChangeNotifier {
  FirebaseDonationAPI firebaseService = FirebaseDonationAPI();
  late Stream<QuerySnapshot> _donoStream;

  Stream<QuerySnapshot> get donoStream => _donoStream;

  void addDonation(Donation donation) async {
    String message =
        await firebaseService.addDonation(donation.toJson(donation));
    print(message);
    notifyListeners();
  }

  void fetchDonationsOrg(String? orgId, String status) {
    _donoStream = firebaseService.getDonationsOrg(orgId, status);
    notifyListeners();
  }

  void fetchDonationsDonor(String? uid, String status) {
    _donoStream = firebaseService.getDonationsDonor(uid, status);
    notifyListeners();
  }

  void fetchDonation(String? id) {
    _donoStream = firebaseService.getDonation(id);
    notifyListeners();
  }

  void changeStatus(String id, String status, String orgId) async {
    await firebaseService.changeStatus(id, status, orgId);
    notifyListeners();
  }

  void linkDonationDrive(String id, String donationDriveId) async {
    String message =
        await firebaseService.linkDonationDrive(id, donationDriveId);
    print(message);
    notifyListeners();
  }
}
