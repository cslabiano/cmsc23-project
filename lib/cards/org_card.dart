import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/models/donor_donation_model.dart';
import 'package:elbigay/models/org_model.dart';
import 'package:elbigay/models/organization_model.dart';
import 'package:flutter/material.dart';

class OrgCard extends StatelessWidget {
  final Stream<QuerySnapshot> organizations;
  const OrgCard({super.key, required this.organizations});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
        child: StreamBuilder(
      stream: organizations,
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

        return SizedBox(
          child: Column(children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: ((context, index) {
                Org org = Org.fromJson(
                    snapshot.data?.docs[index].data() as Map<String, dynamic>);

                return Column(children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/donor_donatepage',
                          arguments: org.orgId);
                      print("Tapped");
                      print(org.orgId);
                    },
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Container(
                      height: screenHeight * 0.2,
                      width: screenWidth * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        // child: Image.asset(
                        // widget.donation.image,
                        // fit: BoxFit.cover,
                        //     ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Tapped");
                    },
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Container(
                      height: screenHeight * 0.069,
                      width: screenWidth * 0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Colors.white,
                          boxShadow: kElevationToShadow[2]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 2),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                            child: Text(
                              org.orgname,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color.fromRGBO(62, 180, 137, 1),
                                fontFamily: 'Lato',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 20, 10),
                            child: Text(
                              org.address[0],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                color: Color.fromRGBO(34, 38, 66, 1),
                                fontFamily: 'Lato',
                                fontSize: 8,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ]);
              }),
            ),
          ]),
        );
      },
    ));
  }
}
