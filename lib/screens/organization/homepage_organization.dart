// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:elbigay/models/donation_model.dart';
import 'package:flutter/material.dart';

class OrganizationHomepage extends StatefulWidget {
  const OrganizationHomepage({super.key});

  @override
  State<OrganizationHomepage> createState() => _OrganizationHomepageState();
}

class _OrganizationHomepageState extends State<OrganizationHomepage> {
  // final List<Donation> _donations = [

  // ];

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: screenHeight * 0.15,
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
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Confirmed",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Scheduled",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Cancelled",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Completed",
                            style: TextStyle(fontWeight: FontWeight.w600),
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
          body: Center(
            child: TabBarView(children: [
              Text("1st tab"),
              Text("2nd tab"),
              Text("3rd tab"),
              Text("4th tab"),
              Text("5th tab"),
            ]),
          )),
    );
  }
}
