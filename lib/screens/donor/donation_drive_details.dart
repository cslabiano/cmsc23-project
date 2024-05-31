import 'package:elbigay/providers/donation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonationDriveDetails extends StatefulWidget {
  final String donationDriveId;
  const DonationDriveDetails({required this.donationDriveId, super.key});

  @override
  State<DonationDriveDetails> createState() => _DonationDriveDetailsState();
}

class _DonationDriveDetailsState extends State<DonationDriveDetails> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.03),
          Stack(children: [
            SizedBox(
              height: screenHeight * 0.24,
              width: screenWidth,
              child: ClipRRect(
                child: Image.asset(
                  'assets/donation_drive.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Positioned(
                    child: Icon(Icons.arrow_back_ios_new,
                        size: 20, color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              top: screenHeight * 0.03,
              left: screenWidth * 0.04,
            ),
          ]),
          SizedBox(height: 13),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Donation Drive",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "May 30, 2024",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 15),
                Text(
                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.''',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 10),
                Divider(color: Theme.of(context).colorScheme.tertiary),
              ],
            ),
          ),
          SizedBox(height: 10),
          SizedBox(height: 10),
          SizedBox(height: screenHeight * 0.05)
        ],
      ),
    );
  }
}
