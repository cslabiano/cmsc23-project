import '/models/donor_model.dart';
import '/providers/donor_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/auth_provider.dart';

class DonorProfilepage extends StatefulWidget {
  const DonorProfilepage({super.key});

  @override
  State<DonorProfilepage> createState() => _DonorProfilepageState();
}

class _DonorProfilepageState extends State<DonorProfilepage> {
  User? user;

  @override
  Widget build(BuildContext context) {
    user = context.read<UserAuthProvider>().user;
    Donor? donor = context.watch<DonorProvider>().donorDetails;
    if (donor == null && user != null) {
      context.read<DonorProvider>().getDetails(user!);
    }

    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(14, 198, 178, 1),
              Color.fromRGBO(37, 212, 147, 1)
            ],
          ),
        ),
        child: Center(
          child: ListView(children: [
            Stack(
              alignment: const Alignment(0, -0.5),
              children: [
                Container(
                  width: screenWidth,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  margin: const EdgeInsets.only(top: 150),
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 70),
                              Text(
                                "${donor!.fname} ${donor.lname}",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              Text(
                                "@${donor.uname}",
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
                                  "About me:",
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
                                  child: Text(donor.bio)),
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
                                    donor.contact,
                                    style:
                                        TextStyle(fontSize: screenWidth * 0.03),
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
                                    donor.email,
                                    style:
                                        TextStyle(fontSize: screenWidth * 0.03),
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
                                    donor.address[0],
                                    style:
                                        TextStyle(fontSize: screenWidth * 0.03),
                                  )
                                ],
                              ),
                              const SizedBox(height: 40),
                              Container(
                                padding: const EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 0),
                                              blurRadius: 3.119379758834839)
                                        ],
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              34, 38, 66, 1),
                                          width: 1,
                                        ),
                                      ),
                                      child: const ListTile(
                                        title: Text(
                                          "My Account",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(34, 38, 66, 1),
                                              fontFamily: 'Lato',
                                              fontSize: 15,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                        leading:
                                            Icon(Icons.account_circle_outlined),
                                        trailing:
                                            Icon(Icons.keyboard_arrow_right),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 0),
                                              blurRadius: 3.119379758834839)
                                        ],
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              34, 38, 66, 1),
                                          width: 1,
                                        ),
                                      ),
                                      child: const ListTile(
                                        title: Text(
                                          "Settings",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(34, 38, 66, 1),
                                              fontFamily: 'Lato',
                                              fontSize: 15,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                        leading: Icon(Icons.settings_outlined),
                                        trailing:
                                            Icon(Icons.keyboard_arrow_right),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 0),
                                              blurRadius: 3.119379758834839)
                                        ],
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              34, 38, 66, 1),
                                          width: 1,
                                        ),
                                      ),
                                      child: const ListTile(
                                        title: Text(
                                          "Help Center",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(34, 38, 66, 1),
                                              fontFamily: 'Lato',
                                              fontSize: 15,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                        leading:
                                            Icon(Icons.help_center_outlined),
                                        trailing:
                                            Icon(Icons.keyboard_arrow_right),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 0),
                                              blurRadius: 3.119379758834839)
                                        ],
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              34, 38, 66, 1),
                                          width: 1,
                                        ),
                                      ),
                                      child: ListTile(
                                        title: const Text(
                                          "Logout",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(34, 38, 66, 1),
                                              fontFamily: 'Lato',
                                              fontSize: 15,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                        leading:
                                            const Icon(Icons.logout_outlined),
                                        trailing: const Icon(
                                            Icons.keyboard_arrow_right),
                                        onTap: () async {
                                          await context
                                              .read<UserAuthProvider>()
                                              .signOut();
                                          if (context.mounted) {
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                '/',
                                                (Route<dynamic> route) =>
                                                    false);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 100)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 45,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 180,
                        width: 180,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromRGBO(14, 198, 178, 1),
                                Color.fromRGBO(37, 212, 147, 1)
                              ],
                            ),
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                          height: 180,
                          width: 180,
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/googlelogo.png',
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
