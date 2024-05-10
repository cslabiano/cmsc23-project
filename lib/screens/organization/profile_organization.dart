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
                          width: 125,
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
                            color: const Color.fromARGB(100, 73, 79, 85),
                          ),
                        ),
                        const SizedBox(height: 12),
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
                        const SizedBox(height: 12),
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
                        const SizedBox(height: 12),
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