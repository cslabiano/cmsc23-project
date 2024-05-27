// ignore_for_file: avoid_print

import 'package:elbigay/models/donation_drive_model.dart';
import 'package:flutter/material.dart';

class DonationDriveCard extends StatelessWidget {
  final List<DonationDrive> donationDrives;
  final String userType;
  const DonationDriveCard(
      {super.key, required this.donationDrives, required this.userType});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: donationDrives.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    // navigate to donation drive page
                    print("tapped");
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
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
                              padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      donationDrives[index].title,
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
                                      donationDrives[index].description,
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
                                        //   donationDrives[index].status,
                                        //   style: const TextStyle(
                                        //       color:Color.fromRGBO( 128, 128, 128, 1)),
                                        // )
                                      ],
                                    )
                                  ]),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20)
              ],
            );
          }),
    );
  }
}
