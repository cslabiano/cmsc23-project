// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class OrganizationProfile extends StatefulWidget {
  const OrganizationProfile({super.key});

  @override
  State<OrganizationProfile> createState() => _OrganizationProfileState();
}

class _OrganizationProfileState extends State<OrganizationProfile> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))
        ),
        margin: EdgeInsets.only(top: screenHeight * 0.30),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 125,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(300),
                            child: Image.asset('assets/googlelogo.png'),
                          )
                        ),
                        Text(
                          "Google",
                          style: TextStyle(
                            fontSize: screenWidth * 0.1,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        Text(
                          "@username",
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(71, 71, 71, 1),
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
                              color: Theme.of(context).colorScheme.secondary,
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
                              color: Theme.of(context).colorScheme.secondary,
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
                                fontSize: screenWidth * 0.03
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
                                fontSize: screenWidth * 0.03
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
                                fontSize: screenWidth * 0.03
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Donation drives:",
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        InkWell(
                          onTap: () {
                            // navigate to donation drive page
                            print("tapped");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                              boxShadow: kElevationToShadow[2],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.1,
                                  width: screenWidth * 0.3,
                                  child: Image.asset('assets/googlelogo.png'),
                                ),
                                const SizedBox(width: 7),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Google donation drive",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context).colorScheme.secondary,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.03,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.timelapse_rounded,
                                              color: Color.fromRGBO(71, 71, 71, 1),
                                              size: screenWidth * 0.05,
                                            ),
                                            const SizedBox(width: 3),
                                            Text(
                                              "4 days left",
                                              style: TextStyle(
                                                color: Color.fromRGBO(71, 71, 71, 1)
                                              ),
                                            )
                                          ],
                                        )
                                      ]
                                    ),
                                  )
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Text("end") // just to fully render the bottom of the donation drive. remove later
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}