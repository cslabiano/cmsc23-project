// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/models/donation_drive_model.dart';
import 'package:flutter/material.dart';

class DonationDriveCard extends StatelessWidget {
  final Stream<QuerySnapshot> donationDrives;
  final String userType;
  const DonationDriveCard(
      {super.key, required this.donationDrives, required this.userType});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: StreamBuilder(
          stream: donationDrives,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error encountered! ${snapshot.error}"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text("No Donation Drives Found"),
              );
            }

            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: ((context, index) {
                  DonationDrive donationDrive = DonationDrive.fromJson(
                      snapshot.data?.docs[index].data()
                          as Map<String, dynamic>);
                  // donationDrive.user = snapshot.data?.[index].id;
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
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 10, 20, 10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            donationDrive.title,
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
                                            donationDrive.description,
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
                                              Text(
                                                donationDrive.dateTime,
                                                style: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        128, 128, 128, 1)),
                                              )
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
                }));
          }),
    );

    // return Expanded(
    //   child: ListView.builder(
    //       shrinkWrap: true,
    //       // physics: const NeverScrollableScrollPhysics(),
    //       itemCount: donationDrives.length,
    //       itemBuilder: (context, index) {
    //         return Column(
    //           children: [
    //             InkWell(
    //               onTap: () {
    //                 // navigate to donation drive page
    //                 print("tapped");
    //               },
    //               child: Column(
    //                 children: [
    //                   Container(
    //                     decoration: BoxDecoration(
    //                       borderRadius:
    //                           const BorderRadius.all(Radius.circular(20)),
    //                       color: Colors.white,
    //                       boxShadow: kElevationToShadow[2],
    //                     ),
    //                     child: Row(
    //                       children: [
    //                         SizedBox(
    //                           height: screenHeight * 0.1,
    //                           width: screenWidth * 0.3,
    //                           // child: Image.asset(
    //                           //     _donationDrives[index]
    //                           //         .image),
    //                         ),
    //                         const SizedBox(width: 7),
    //                         Expanded(
    //                             child: Container(
    //                           padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
    //                           child: Column(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Text(
    //                                   donationDrives[index].title,
    //                                   overflow: TextOverflow.ellipsis,
    //                                   style: TextStyle(
    //                                     fontSize: screenWidth * 0.05,
    //                                     fontWeight: FontWeight.w600,
    //                                     color: Theme.of(context)
    //                                         .colorScheme
    //                                         .secondary,
    //                                   ),
    //                                 ),
    //                                 const SizedBox(height: 2),
    //                                 Text(
    //                                   donationDrives[index].description,
    //                                   overflow: TextOverflow.ellipsis,
    //                                   maxLines: 3,
    //                                   style: TextStyle(
    //                                     fontSize: screenWidth * 0.03,
    //                                   ),
    //                                 ),
    //                                 const SizedBox(height: 2),
    //                                 Row(
    //                                   children: [
    //                                     Icon(
    //                                       Icons.timelapse_rounded,
    //                                       color: const Color.fromRGBO(
    //                                           128, 128, 128, 1),
    //                                       size: screenWidth * 0.05,
    //                                     ),
    //                                     const SizedBox(width: 3),
    //                                     Text(
    //                                       donationDrives[index].dateTime,
    //                                       style: const TextStyle(
    //                                           color: Color.fromRGBO(
    //                                               128, 128, 128, 1)),
    //                                     )
    //                                   ],
    //                                 )
    //                               ]),
    //                         )),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             const SizedBox(height: 20)
    //           ],
    //         );
    //       }),
    // );
  }
}
