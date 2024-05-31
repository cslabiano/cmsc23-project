import '/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(screenWidth * 0.03),
        width: screenWidth,
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.3),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Admin",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.2,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenWidth * 0.1),
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenWidth * 0.1),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 239, 239, 239),
                        borderRadius: BorderRadius.circular(15)),
                    child: Table(
                      columnWidths: const {
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      children: [
                        TableRow(
                          children: [
                            Text(
                              "23",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: Text("organizations registered"),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "142",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: Text("donors signed up"),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "132,400",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: Text("money raised overall"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.06,
                      child: OutlinedButton(
                        onPressed: () async {
                          await context.read<UserAuthProvider>().signOut();
                          if (context.mounted) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/', (Route<dynamic> route) => false);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          side:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Log out",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
