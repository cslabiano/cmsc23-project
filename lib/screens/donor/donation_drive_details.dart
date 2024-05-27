import 'package:flutter/material.dart';

class DonationDriveDetails extends StatefulWidget {
  const DonationDriveDetails({super.key});

  @override
  State<DonationDriveDetails> createState() => _DonationDriveDetailsState();
}

class _DonationDriveDetailsState extends State<DonationDriveDetails> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final List<String> donors = [
      'Adrian Javier',
      'Nathan Abellanida',
      'Myndie Labiano'
    ];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 189,
            width: screenWidth,
            child: ClipRRect(
              child: Image.asset(
                'assets/donation_drive.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
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
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text("Donors",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          SizedBox(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: donors.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${donors[index]}"),
                              SizedBox(height: 20)
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05)
        ],
      ),
    );
  }
}
