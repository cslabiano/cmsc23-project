// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:elbigay/models/donation_model.dart';
import 'package:elbigay/providers/auth_provider.dart';
import 'package:elbigay/screens/organization/homepage_tabs.dart';
import 'package:elbigay/screens/organization/scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganizationHomepage extends StatefulWidget {
  const OrganizationHomepage({super.key});

  @override
  State<OrganizationHomepage> createState() => _OrganizationHomepageState();
}

class _OrganizationHomepageState extends State<OrganizationHomepage> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    User? user = context.watch<UserAuthProvider>().user;

    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: screenHeight * 0.16,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                    Color.fromRGBO(14, 198, 178, 1),
                    Color.fromRGBO(37, 212, 147, 1)
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Good day!",
                      style: TextStyle(
                          color: Colors.white, fontSize: screenWidth * 0.06),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Here are the donations to you...",
                      style: TextStyle(
                          color: Colors.white, fontSize: screenWidth * 0.045),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(157, 214, 193, 1)),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: TabBar(
                      labelPadding: EdgeInsets.all(0.0),
                      indicatorWeight: 6,
                      labelColor: Colors.black,
                      indicatorColor: Color.fromRGBO(158, 217, 195, 1),
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(
                          child: Text(
                            "Pending",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Confirmed",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Scheduled",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Cancelled",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Completed",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            Center(
              child: TabBarView(children: [
                HomepageTab(tabTitle: "Pending"),
                HomepageTab(tabTitle: "Confirmed"),
                HomepageTab(tabTitle: "Scheduled"),
                HomepageTab(tabTitle: "Cancelled"),
                HomepageTab(tabTitle: "Completed"),
              ]),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 18, right: 18),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Scanner(orgId: user!.uid)));
                  },
                  child: Icon(Icons.qr_code_scanner),
                ),
              ),
            )
          ]),
        ));
  }
}
