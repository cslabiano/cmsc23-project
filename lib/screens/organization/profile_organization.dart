// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:elbigay/models/donation_drive_model.dart';

class OrganizationProfile extends StatefulWidget {
  const OrganizationProfile({super.key});

  @override
  State<OrganizationProfile> createState() => _OrganizationProfileState();
}

class _OrganizationProfileState extends State<OrganizationProfile> {
  final List<DonationDrive> _donationDrives = [
    DonationDrive(image: 'assets/googlelogo.png', title: "title1", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", timeLeft: "4 days left"),
    DonationDrive(image: 'assets/googlelogo.png', title: "title2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", timeLeft: "3 days left"),
    DonationDrive(image: 'assets/googlelogo.png', title: "title3", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", timeLeft: "2 days left"),
  ];

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                  ),
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
                                  color: Theme.of(context).colorScheme.secondary,
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
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _donationDrives.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      // navigate to donation drive page
                                      print("tapped");
                                    },
                                    child: Column(
                                      children: [
                                        Container(
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
                                                child: Image.asset(_donationDrives[index].image),
                                              ),
                                              const SizedBox(width: 7),
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        _donationDrives[index].title,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: screenWidth * 0.05,
                                                          fontWeight: FontWeight.w600,
                                                          color: Theme.of(context).colorScheme.secondary,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 2),
                                                      Text(
                                                        _donationDrives[index].description,
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
                                                            color: const Color.fromRGBO(128, 128, 128, 1),
                                                            size: screenWidth * 0.05,
                                                          ),
                                                          const SizedBox(width: 3),
                                                          Text(
                                                            _donationDrives[index].timeLeft,
                                                            style: TextStyle(
                                                              color: const Color.fromRGBO(128, 128, 128, 1)
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
                                        const SizedBox(height: 20)
                                      ],
                                    ),
                                  );
                                }
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: kElevationToShadow[4],
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                    color: Color.fromRGBO(34, 38, 66, 1),
                                    width: 2,
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    "My Account",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color:
                                          Color.fromRGBO(34, 38, 66, 1),
                                      fontFamily: 'Lato',
                                      fontSize: 15,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                    ),
                                  ),
                                  leading: Icon(Icons.account_circle_outlined),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: kElevationToShadow[4],
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                    color: Color.fromRGBO(34, 38, 66, 1),
                                    width: 2,
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    "Settings",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color:
                                          Color.fromRGBO(34, 38, 66, 1),
                                      fontFamily: 'Lato',
                                      fontSize: 15,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                    ),
                                  ),
                                  leading: Icon(Icons.settings_outlined),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: kElevationToShadow[4],
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                    color: Color.fromRGBO(34, 38, 66, 1),
                                    width: 2,
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    "Help Center",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color:
                                          Color.fromRGBO(34, 38, 66, 1),
                                      fontFamily: 'Lato',
                                      fontSize: 15,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                    ),
                                  ),
                                  leading: Icon(Icons.help_outline_outlined),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {

                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: kElevationToShadow[4],
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                    color: Color.fromRGBO(34, 38, 66, 1),
                                    width: 2,
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    "Log Out",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color:
                                          Color.fromRGBO(34, 38, 66, 1),
                                      fontFamily: 'Lato',
                                      fontSize: 15,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                    ),
                                  ),
                                  leading: Icon(Icons.logout_outlined),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    Navigator.popUntil(context, ModalRoute.withName('/signin'));
                                    // Navigator.pushNamed(context, '/');
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
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle
                      ),
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                    ),
                    SizedBox(
                      height: 125,
                      width: 125,
                      child: ClipRRect(
                        child: Image.asset('assets/googlelogo.png'),
                      )
                    )
                  ],
                ),
                ),
                // OrgNavbar()
              ],
            )
          ],
        )
      )
    );
  }
}