// ignore_for_file: prefer_const_constructors

import 'package:elbigay/models/donation_drive_model.dart';
import 'package:flutter/material.dart';

class OrganizationDonationDrive extends StatefulWidget {
  const OrganizationDonationDrive({super.key});

  @override
  State<OrganizationDonationDrive> createState() =>
      _OrganizationDonationDriveState();
}

class _OrganizationDonationDriveState extends State<OrganizationDonationDrive> {
  final List<DonationDrive> _donationDrives = [];

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: screenHeight * 0.2,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: const [
                  Color.fromRGBO(14, 198, 178, 1),
                  Color.fromRGBO(37, 212, 147, 1)
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: screenHeight * 0.1),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Good day!",
                    style: TextStyle(
                        color: Colors.white, fontSize: screenWidth * 0.09),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Here are your donation drives",
                    style: TextStyle(
                        color: Colors.white, fontSize: screenWidth * 0.05),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                SizedBox(
                  height: 15,
                  child: Container(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(157, 214, 193, 1)),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        backgroundColor: Color.fromRGBO(243, 237, 237, 1),
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                                boxShadow: kElevationToShadow[2],
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.1,
                                    width: screenWidth * 0.3,
                                    // child: Image.asset(
                                    //     _donationDrives[index]
                                    //         .image),
                                  ),
                                  const SizedBox(width: 7),
                                  Expanded(
                                      child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 10, 20, 10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _donationDrives[index].title,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
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
                                                color: const Color.fromRGBO(
                                                    128, 128, 128, 1),
                                                size: screenWidth * 0.05,
                                              ),
                                              const SizedBox(width: 3),
                                              // Text(
                                              //   _donationDrives[
                                              //           index]
                                              //       .timeLeft,
                                              //   style: TextStyle(
                                              //       color: const Color
                                              //           .fromRGBO(
                                              //           128,
                                              //           128,
                                              //           128,
                                              //           1)),
                                              // )
                                            ],
                                          )
                                        ]),
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20)
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        )));
  }
}
