// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:elbigay/models/donor_donation_model.dart';
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

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: screenHeight * 0.2,
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
                    "Here are the donations to you...",
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
        backgroundColor: Color.fromRGBO(243, 237, 237, 1),
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              // child: Column(
              //   children: [
              //     const SizedBox(height: 20),
              //     Expanded(
              //       child: ListView.builder(
              //         shrinkWrap: true,
              //         itemCount: _donations.length,
              //         itemBuilder: ((context, index) {
              //           return InkWell(
              //             onTap: () {},
              //             child: Column(
              //               children: [
              //                 Container(
              //                   decoration: BoxDecoration(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(20)),
              //                     color: Colors.white,
              //                     boxShadow: kElevationToShadow[1],
              //                   ),
              //                   child: Row(
              //                     children: [
              //                       Container(
              //                         decoration:
              //                             BoxDecoration(shape: BoxShape.circle),
              //                         child: SizedBox(
              //                             height: screenHeight * 0.1,
              //                             width: screenWidth * 0.3,
              //                             child: ClipRRect(
              //                               child: Image.asset(
              //                                   'assets/googlelogo.png'),
              //                             )),
              //                       ),
              //                       const SizedBox(width: 7),
              //                       Expanded(
              //                         child: Container(
              //                             padding: const EdgeInsets.symmetric(
              //                                 vertical: 20, horizontal: 0),
              //                             child: Column(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               children: [
              //                                 Text(_donations[index].itemType,
              //                                     style: TextStyle(
              //                                       fontSize: screenWidth * 0.05,
              //                                       fontWeight: FontWeight.w600,
              //                                       color: Color.fromRGBO(
              //                                           34, 38, 66, 1),
              //                                     )),
              //                                 Text(
              //                                   "from ${_donations[index].donorName}",
              //                                   style: TextStyle(
              //                                     fontSize: screenWidth * 0.04,
              //                                     fontWeight: FontWeight.w600,
              //                                     foreground: Paint()..shader = LinearGradient(
              //                                       colors: [
              //                                         Color.fromRGBO(14, 198, 177, 1),
              //                                         Color.fromRGBO(33, 197, 139, 1)
              //                                         ]
              //                                       ).createShader(Rect.fromLTWH(0.0, 0.0,200.0, 100.0)
              //                                     )
              //                                   )
              //                                 ),
              //                                 SizedBox(height: 10),
              //                                 Text(_donations[index].status,
              //                                     style: TextStyle(
              //                                       fontSize: screenWidth * 0.037,
              //                                       fontWeight: FontWeight.w600,
              //                                       color: Color.fromRGBO(
              //                                           156, 157, 159, 1),
              //                                     )),
              //                               ],
              //                             )
              //                           ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 const SizedBox(height: 10)
              //               ],
              //             ),
              //           );
              //         }),
              //       ),
              //     ),
              //   ],
              // ),
            )
      )
    );
  }
}
