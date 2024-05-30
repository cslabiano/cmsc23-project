import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/cards/org_card.dart';
import 'package:elbigay/models/donor_donation_model.dart';
import 'package:elbigay/models/donor_model.dart';
import 'package:elbigay/providers/auth_provider.dart';
import 'package:elbigay/providers/donor_provider.dart';
import 'package:elbigay/providers/org_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../../models/donor_donation_model.dart';

class DonorHomepage extends StatefulWidget {
  const DonorHomepage({super.key});

  @override
  State<DonorHomepage> createState() => _DonorHomepageState();
}

class _DonorHomepageState extends State<DonorHomepage> {
  User? user;
  @override
  Widget build(BuildContext context) {
    user = context.read<UserAuthProvider>().user;
    Donor? donor = context.watch<DonorProvider>().donorDetails;
    if (donor == null && user != null) {
      context.read<DonorProvider>().getDetails(user!);
    }
    context.read<OrganizationProvider>().fetchOrganizations();
    Stream<QuerySnapshot> orgStream = context.watch<OrganizationProvider>().org;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  "Hello ${donor!.uname}!",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 27,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  "Where do you want to donate today",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(156, 157, 159, 1),
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    height: 1,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: -4,
                      blurRadius: 3,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              OrgCard(organizations: orgStream),
            ],
          ),
        ),
      ),
    );
  }
}
