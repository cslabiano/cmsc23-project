// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:elbigay/models/donation_drive_model.dart';
import 'package:elbigay/screens/organization/add_donation_drive_textfield.dart';
import 'package:flutter/material.dart';

class AddDonationDrive extends StatefulWidget {
  const AddDonationDrive({super.key});

  @override
  State<AddDonationDrive> createState() => _AddDonationDriveState();
}

class _AddDonationDriveState extends State<AddDonationDrive> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    late DonationDrive donationDrive;
    late String userId;
    late String title;
    late String description;
    String status = "Open";

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
                "Create New Donation Drive",
                style: TextStyle(
                    color: Theme.of(context).primaryColor, 
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DonationDriveInputField(label: "title", callback: (String val) => title = val),
              DonationDriveInputField(label: "description", callback: (String val) => description = val),
            ],
          )
        ),
      )
    );
  }
}