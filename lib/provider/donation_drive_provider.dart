import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/api/firebase_donation_drive_api.dart';
import 'package:flutter/material.dart';

class DonationDriveProvider extends ChangeNotifier {
  FirebaseDonationDriveAPI firebaseService = FirebaseDonationDriveAPI();
  late Stream<QuerySnapshot> _donationDrivesStream;

  DonationDriveProvider() {
    fetchDonationDrives();
  }

  Stream<QuerySnapshot> get donationDrives => _donationDrivesStream;

  void fetchDonationDrives() {
    _donationDrivesStream = firebaseService.getAllDonationDrives();
  }
}