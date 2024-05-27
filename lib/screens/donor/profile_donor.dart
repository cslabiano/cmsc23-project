// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class DonorProfilepage extends StatefulWidget {
  const DonorProfilepage({super.key});

  @override
  State<DonorProfilepage> createState() => _DonorProfilepageState();
}

class _DonorProfilepageState extends State<DonorProfilepage> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
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
                  margin: EdgeInsets.only(top: 150),
                  child: Column(
                    children: [
                      // Container(height: 100),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 60),
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
                              SizedBox(height: 20),
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
                                    "org@gmail.com",
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
                                    "567R+VR3, Harold Cuzner Royal Palm Ave, Los Baños",
                                    style:
                                        TextStyle(fontSize: screenWidth * 0.03),
                                  )
                                ],
                              ),
                              SizedBox(height: 40),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 0),
                                              blurRadius: 3.119379758834839)
                                        ],
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
                                padding: EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 0),
                                              blurRadius: 3.119379758834839)
                                        ],
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
                                padding: EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 0),
                                              blurRadius: 3.119379758834839)
                                        ],
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
                                padding: EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 0),
                                              blurRadius: 3.119379758834839)
                                        ],
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        border: Border.all(
                                          color: Color.fromRGBO(34, 38, 66, 1),
                                          width: 1,
                                        ),
                                      ),
                                      child: ListTile(
                                        title: Text(
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
                                        leading: Icon(Icons.logout_outlined),
                                        trailing:
                                            Icon(Icons.keyboard_arrow_right),
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
                              SizedBox(height: 100)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 75,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 147,
                        width: 147,
                        decoration: BoxDecoration(
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
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                      SizedBox(
                          height: 125,
                          width: 125,
                          child: ClipRRect(
                            child: Image.asset('assets/googlelogo.png'),
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
