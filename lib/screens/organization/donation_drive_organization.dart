// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elbigay/models/donation_drive_model.dart';
import 'package:elbigay/providers/auth_provider.dart';
import 'package:elbigay/providers/donation_drive_provider.dart';
import 'package:elbigay/screens/organization/donation_drive_card_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganizationDonationDrive extends StatefulWidget {
  const OrganizationDonationDrive({super.key});

  @override
  State<OrganizationDonationDrive> createState() =>
      _OrganizationDonationDriveState();
}

class _OrganizationDonationDriveState extends State<OrganizationDonationDrive> {
  // final List<DonationDrive> _donationDrives = [];
  User? user;

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    user = context.read<UserAuthProvider>().user;
    context.watch<DonationDriveProvider>().fetchDonationDrives(user!.uid);
    Stream<QuerySnapshot> donationDriveStream =
        context.watch<DonationDriveProvider>().donationDrives;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Your Donation Drives",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w600),
                ),
                // SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(26, 206, 161, 1),
          onPressed: () {
            Navigator.pushNamed(context, '/add_donation_drive');
          },
          child: Icon(
            Icons.add,
            size: screenWidth * 0.1,
          ),
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              const SizedBox(height: 10),
              DonationDriveCard(
                  donationDrives: donationDriveStream, userType: "org")
            ],
          ),
        )));
  }
}
