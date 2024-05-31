// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/org_provider.dart';
import '../../models/org_model.dart';

class OrganizationProfile extends StatefulWidget {
  const OrganizationProfile({super.key});

  @override
  State<OrganizationProfile> createState() => _OrganizationProfileState();
}

class _OrganizationProfileState extends State<OrganizationProfile> {
  User? user;
  late bool isAccepting;

  @override
  Widget build(BuildContext context) {
    user = context.read<UserAuthProvider>().user;
    Org? org = context.watch<OrganizationProvider>().organization;
    if (org == null && user != null) {
      context.read<OrganizationProvider>().getDetails(user!);
    }

    isAccepting = org!.isOpen;

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
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60,
                              ),
                              Text(
                                org!.orgname,
                                // "displayName",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.1,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              Text(
                                "@${org.uname}",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(128, 128, 128, 1),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Accepting Donations? ",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (isAccepting == true) {
                                        setState(() {
                                          isAccepting = false;
                                        });
                                      } else {
                                        setState(() {
                                          isAccepting = true;
                                        });
                                      }
                                      context
                                          .read<OrganizationProvider>()
                                          .updateDonationStatus(
                                              org.orgId!, isAccepting);
                                    },
                                    child: (org.isOpen == false)
                                        ? Icon(
                                            Icons.toggle_off_outlined,
                                            size: screenWidth * 0.1,
                                          )
                                        : Icon(
                                            Icons.toggle_on_outlined,
                                            size: screenWidth * 0.1,
                                          ),
                                  ),
                                ],
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
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(org.description)),
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
                                    org.contact,
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
                                    org.email,
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
                                    org.address[0],
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
                                  onTap: () async {
                                    await context
                                        .read<UserAuthProvider>()
                                        .signOut();
                                    if (context.mounted) {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          '/', (Route<dynamic> route) => false);
                                    }
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
