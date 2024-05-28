import 'package:elbigay/api/firebase_organization_api.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/org_model.dart';

class OrganizationProvider with ChangeNotifier {
  FirebaseOrganizationAPI firebaseService = FirebaseOrganizationAPI();
  late Stream<User?> _oStream;

  Stream<User?> get oStream => _oStream;

  Org? _organization;
  Org? get organization => _organization;

  Future<void> getDetails(User user) async {
    _organization = await firebaseService.getDetails(user);
    notifyListeners();
  }
}
