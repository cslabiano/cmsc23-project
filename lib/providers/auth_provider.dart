import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../api/firebase_auth_api.dart';
import '../models/donor.dart';

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
  Future<void> signUpDonor(Donor donor, String password, String contact,
      List<String> address) async {
    await authService.signUpDonor(donor, password);
    notifyListeners();
  }

  Future<void> signUpOrg(String usertype, String email, String orgname,
      String uname, String password, int contact, List<String> address) async {
    await authService.signUpOrg(
        usertype, email, orgname, uname, password, contact, address);
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    await authService.signIn(email, password);
    notifyListeners();
  }

  Future<void> signOut() async {
    await authService.signOut();
    notifyListeners();
  }
}
