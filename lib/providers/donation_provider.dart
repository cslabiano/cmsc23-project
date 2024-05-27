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

  void fetchDonationsOrg(String? orgId) {
    _donoStream = firebaseService.getDonationsOrg(orgId);
    notifyListeners();
  }

  void fetchDonationsDonor(String? uid) {
    _donoStream = firebaseService.getDonationsDonor(uid);
    notifyListeners();
  }

  void fetchDonation(String? id) {
    _donoStream = firebaseService.getDonation(id);
  }

  void changeStatus(String id, String status) async {
    await firebaseService.changeStatus(id, status);
    notifyListeners();
  }
}
