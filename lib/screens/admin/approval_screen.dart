import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/cards/org_card.dart';
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
  @override
  Widget build(BuildContext context) {
    context.watch<OrganizationProvider>().fetchOrganizations();
    Stream<QuerySnapshot> orgStream = context.watch<OrganizationProvider>().org;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: const TextField(
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
