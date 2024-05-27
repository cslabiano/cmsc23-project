import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/api/firebase_donor_api.dart';
import 'package:flutter/material.dart';

class DonorProvider with ChangeNotifier {
  FirebaseDonorAPI firebaseService = FirebaseDonorAPI();
  late Stream<QuerySnapshot> _donorStream;
  late Stream<QuerySnapshot> _donor;

  DonorProvider() {
    fetchDonors();
  }

  Stream<QuerySnapshot> get donors => _donorStream;
  Stream<QuerySnapshot> get donor => _donor;

  void fetchDonors() {
    _donorStream = firebaseService.getDonors();
    notifyListeners();
  }

  void fetchDonor(String? email) {
    _donor = firebaseService.getDonor(email);
    notifyListeners();
  }
}
