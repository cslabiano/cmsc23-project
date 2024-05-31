import 'package:cloud_firestore/cloud_firestore.dart';
import '/api/firebase_admin_api.dart';
import 'package:flutter/material.dart';

class AdminProvider with ChangeNotifier {
  FirebaseAdminAPI firebaseService = FirebaseAdminAPI();
  late Stream<QuerySnapshot> _uStream;
  late Stream<QuerySnapshot> _dStream;
  late Stream<QuerySnapshot> _vStream;
  late Stream<QuerySnapshot> _donorStream;

  Stream<QuerySnapshot> get dStream => _dStream;
  Stream<QuerySnapshot> get uStream => _uStream;
  Stream<QuerySnapshot> get vStream => _vStream;
  Stream<QuerySnapshot> get donorStream => _donorStream;

  Stream<QuerySnapshot> fetchAllDonor() {
    _donorStream = firebaseService.getAllDonor();
    notifyListeners();
    return _donorStream;
  }

  Stream<QuerySnapshot> fetchUnverifiedOrgs() {
    _uStream = firebaseService.getUnverified();
    notifyListeners();
    return _uStream;
  }

  Stream<QuerySnapshot> fetchVerifiedOrgs() {
    _vStream = firebaseService.getVerified();
    notifyListeners();
    return _vStream;
  }

  void fetchDonations(String status) {
    _dStream = firebaseService.getDonations(status);
    notifyListeners();
  }

  void approveOrg(String? orgId) async {
    await firebaseService.editVerification(orgId!);
    notifyListeners();
  }
}
