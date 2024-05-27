import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpOption extends StatelessWidget {
  const SignUpOption({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
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
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          margin: EdgeInsets.symmetric(
              vertical: screenHeight * 0.15, horizontal: screenWidth * 0.04),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            child: InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: screenHeight * 0.05),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    // color: Colors.amber,
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.volunteer_activism_outlined,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        size: screenWidth * 0.3,
                                      ),
                                      Text(
                                        "Donor",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, '/signup_donor');
                                }),
                          ),
                          Divider(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          Material(
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.05),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  // color: Colors.amber,
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.groups_outlined,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: screenWidth * 0.3,
                                    ),
                                    Text(
                                      "Organization",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/signup_org');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
