import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/api/firebase_donor_api.dart';
import 'package:elbigay/models/donor_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Donor? get donorDetails => _donorDetails;
  Donor? _donorDetails;

  void fetchDonors() {
    _donorStream = firebaseService.getDonors();
    notifyListeners();
  }

  void fetchDonor(String? email) {
    _donor = firebaseService.getDonor(email);
    notifyListeners();
  }

  Future<void> getDetails(User user) async {
    _donorDetails = await firebaseService.getDetails(user);
    notifyListeners();
  }
}
