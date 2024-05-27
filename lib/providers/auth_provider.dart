import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../api/firebase_auth_api.dart';
import '../models/donor_model.dart';
import '../models/org_model.dart';

class UserAuthProvider with ChangeNotifier {
  late FirebaseAuthAPI authService;
  late Stream<User?> _uStream;
  User? userObj;

  UserAuthProvider() {
    authService = FirebaseAuthAPI();
    fetchAuthentication();
  }

  Stream<User?> get userStream => _uStream;
  User? get user => authService.getUser();

  void fetchAuthentication() {
    _uStream = authService.userSignedIn();
    notifyListeners();
  }

  // accepts firstname and lastname aside from email and password
  Future<void> signUpDonor(Donor donor, String password) async {
    await authService.signUpDonor(donor, password);
    notifyListeners();
  }

  Future<void> signUpOrg(Org org, String password) async {
    await authService.signUpOrg(org, password);
    notifyListeners();
  }

  Future<void> signIn(String uname, String password) async {
    await authService.signIn(uname, password);
    notifyListeners();
  }

  Future<void> getUsertype(String uname) async {
    await authService.getUsertype(uname);
    notifyListeners();
  }

  Future<void> signOut() async {
    await authService.signOut();
    notifyListeners();
  }
}
