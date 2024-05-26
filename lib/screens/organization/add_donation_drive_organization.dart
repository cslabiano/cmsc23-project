// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:elbigay/models/donation_drive_model.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class AddDonationDrive extends StatefulWidget {
  const AddDonationDrive({super.key});

  @override
  State<AddDonationDrive> createState() => _AddDonationDriveState();
}

class _AddDonationDriveState extends State<AddDonationDrive> {
  final _formKey = GlobalKey<FormState>();
  late DonationDrive donationDrive;
  String? userId;
  String? title;
  String? description;
  String status = "Open";

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              titleField,
              descriptionField,
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text(
                      "Upload image",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                    const Text(
                      '*',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              GestureDetector(
                onTap: () {},
                child: DottedBorder(
                  dashPattern: const [7, 3],
                  strokeWidth: 2,
                  color: Theme.of(context).colorScheme.primary,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      width: double.infinity,
                      height: screenHeight * 0.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.photo_library,
                                  color: Theme.of(context).primaryColor,
                                  size: screenWidth * 0.15),
                              Text("Take a photo or browse",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold)),
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()), // to make sure that the create button is always at the bottom
              buttons,
            ],
          )
        ),
      )
    );
  }

  Widget get titleField => Column(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Text(
              "Title",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
            const Text(
              '*',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 5,),
      TextFormField(
        validator: (val) {
          if (val == null || val.isEmpty) {
            return "Please enter title!";
          }
          return null;
        },
        onSaved: (val) => setState(() => title = val),
        decoration: InputDecoration(
          hintText: "Enter donation drive title",
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      SizedBox(height: 10,),
    ],
  );

  Widget get descriptionField => Column(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Text(
              "Description",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
            const Text(
              '*',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 5,),
      TextFormField(
        maxLines: 5,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return "Please enter description!";
          }
          return null;
        },
        onSaved: (val) => setState(() => description = val),
        decoration: InputDecoration(
          hintText: "Enter donation drive description",
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      SizedBox(height: 10,),
    ],
  );

  Widget get buttons => Column(
    children: [
      Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primary,
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
            Color.fromRGBO(14, 198, 178, 1),
            Color.fromRGBO(37, 212, 147, 1)
            ]
          ),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Theme.of(context).primaryColor),
          boxShadow: kElevationToShadow[2],
        ),
        child: InkWell(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              Navigator.pop(context);
            }
          },
          child: Text(
            "Create",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white
            ),
          )
        ),
      ),
      SizedBox(height: 10,),
      Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Theme.of(context).primaryColor),
          boxShadow: kElevationToShadow[2],
        ),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancel",
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColor
            ),
          )
        ),
      ),
      SizedBox(height: 30,)
    ],
  );
}