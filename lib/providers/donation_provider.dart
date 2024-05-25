import 'package:elbigay/api/firebase_donation_api.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/models/donor_donation_model.dart';

class DonationProvider with ChangeNotifier {
  FirebaseDonationAPI firebaseService = FirebaseDonationAPI();
  late Stream<Donation>? _donoStream;
  Donation? donoObject;

  Stream<Donation>? get donoStream => _donoStream;
  Donation? get donation => donoObject;

  void addDonation(Donation donation) async {
    String message =
        await firebaseService.addDonation(donation.toJson(donation));
    print(message);
    notifyListeners();
  }
}
