// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';

class OrganizationProfile extends StatefulWidget {
  const OrganizationProfile({super.key});

  @override
  State<OrganizationProfile> createState() => _OrganizationProfileState();
}

class _OrganizationProfileState extends State<OrganizationProfile> {
  // final List<DonationDrive> _donationDrives = [
  //   DonationDrive(userId: '1', title: 'title 1', description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", status: "Open"),
  //   DonationDrive(userId: '1', title: 'title 2', description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", status: "Open"),
  //   DonationDrive(userId: '1', title: 'title 3', description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", status: "Closed"),
  //   DonationDrive(userId: '1', title: 'title 4', description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", status: "Open"),
  // ];

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color.fromRGBO(26, 206, 161, 1),
        resizeToAvoidBottomInset: false,
        body: Center(
            child: ListView(
          children: [
            Stack(
              alignment: Alignment(0, 0),
              children: [
                Container(
                  width: screenWidth,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  margin: EdgeInsets.only(top: screenHeight * 0.2),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60,
                              ),
                              Text(
                                "Google",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.1,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              Text(
                                "@username",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(128, 128, 128, 1),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "About us:",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ),
                              const Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                              ),
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Contact:",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    size: screenWidth * 0.05,
                                  ),
                                  const SizedBox(width: 7),
                                  Text(
                                    "09123456789",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.mail,
                                    size: screenWidth * 0.05,
                                  ),
                                  const SizedBox(width: 7),
                                  Text(
                                    "org@gmail.com",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    size: screenWidth * 0.05,
                                  ),
                                  const SizedBox(width: 7),
                                  Text(
                                    "567R+VR3, Harold Cuzner Royal Palm Ave, Los Baños",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              // Align(
                              //   alignment: Alignment.topLeft,
                              //   child: Text(
                              //     "Donation drives:",
                              //     style: TextStyle(
                              //       fontSize: screenWidth * 0.05,
                              //       fontWeight: FontWeight.w600,
                              //       color:
                              //           Theme.of(context).colorScheme.secondary,
                              //     ),
                              //   ),
                              // ),
                              // DonationDriveCard(donationDrives: _donationDrives, userType: "org"),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: kElevationToShadow[2],
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                    color: Color.fromRGBO(34, 38, 66, 1),
                                    width: 1,
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    "My Account",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(34, 38, 66, 1),
                                        fontFamily: 'Lato',
                                        fontSize: screenWidth * 0.04,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w600,
                                        height: 1),
                                  ),
                                  leading: Icon(Icons.account_circle_outlined),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: kElevationToShadow[2],
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                    color: Color.fromRGBO(34, 38, 66, 1),
                                    width: 1,
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    "Settings",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(34, 38, 66, 1),
                                        fontFamily: 'Lato',
                                        fontSize: screenWidth * 0.04,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w600,
                                        height: 1),
                                  ),
                                  leading: Icon(Icons.settings_outlined),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: kElevationToShadow[2],
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                    color: Color.fromRGBO(34, 38, 66, 1),
                                    width: 1,
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    "Help Center",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(34, 38, 66, 1),
                                        fontFamily: 'Lato',
                                        fontSize: screenWidth * 0.04,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w600,
                                        height: 1),
                                  ),
                                  leading: Icon(Icons.help_outline_outlined),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: kElevationToShadow[2],
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                    color: Color.fromRGBO(34, 38, 66, 1),
                                    width: 1,
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    "Log Out",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(34, 38, 66, 1),
                                        fontFamily: 'Lato',
                                        fontSize: screenWidth * 0.04,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w600,
                                        height: 1),
                                  ),
                                  leading: Icon(Icons.logout_outlined),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    Navigator.popUntil(context,
                                        ModalRoute.withName('/signin'));
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.11,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 147,
                        width: 147,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(26, 206, 161, 1),
                            shape: BoxShape.circle),
                      ),
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                      Container(
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: SizedBox(
                            height: 125,
                            width: 125,
                            child: ClipRRect(
                              child: Image.asset('assets/googlelogo.png'),
                            )),
                      )
                    ],
                  ),
                ),
                // OrgNavbar()
              ],
            )
          ],
        )));
  }
}
