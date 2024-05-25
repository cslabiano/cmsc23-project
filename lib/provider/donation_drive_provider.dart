// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/api/firebase_donation_drive_api.dart';
import 'package:elbigay/models/donation_drive_model.dart';
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
    notifyListeners();
  }

  Future<DonationDrive?> getDonationDrive(String id) async {
    return await firebaseService.getDonationDrive(id);
  }

  void addDonationDrive(DonationDrive donationDrive) async {
    String message = await firebaseService.addDonationDrive(donationDrive);
    print(message);
    notifyListeners();
  }

  void editDonationDrive(String id, String title, String description, bool status) async {
    String message = await firebaseService.editDonationDrive(id, title, description, status);
    print(message);
    notifyListeners();
  }

  void deleteDonationDrive(String id) async {
    String message = await firebaseService.deleteDonationDrive(id);
    print(message);
    notifyListeners();
  }
}
