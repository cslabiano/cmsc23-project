import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/api/firebase_organization_api.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/org_model.dart';

class OrganizationProvider with ChangeNotifier {
  FirebaseOrganizationAPI firebaseService = FirebaseOrganizationAPI();
  late Stream<User?> _oStream;
  late Stream<QuerySnapshot> _orgStream;

  Stream<User?> get oStream => _oStream;

  OrganizationProvider() {
    fetchOrganizations();
  }

  Org? _organization;
  Org? get organization => _organization;
  Stream<QuerySnapshot> get org => _orgStream;

  Future<void> getDetails(User user) async {
    _organization = await firebaseService.getDetails(user);
    notifyListeners();
  }

  void fetchOrganizations() {
    _orgStream = firebaseService.getAllOrganizations();
    notifyListeners();
  }
}
