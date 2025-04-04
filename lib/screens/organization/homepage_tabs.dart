// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/screens/organization/donation_details_organization.dart';
import '/models/donor_donation_model.dart';
import '/providers/auth_provider.dart';
import '/providers/donation_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomepageTab extends StatefulWidget {
  final String tabTitle;
  const HomepageTab({super.key, required this.tabTitle});

  @override
  State<HomepageTab> createState() => _HomepageTabState();
}

class _HomepageTabState extends State<HomepageTab> {
  User? user;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    user = context.read<UserAuthProvider>().user;
    context
        .watch<DonationProvider>()
        .fetchDonationsOrg(user!.uid, widget.tabTitle);
    Stream<QuerySnapshot> donations =
        context.watch<DonationProvider>().donoStream;

    return Expanded(
      child: StreamBuilder(
          stream: donations,
          builder: ((context, snapshot) {
            // print("Length" + snapshot.data!.docs.length.toString());
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
                child: Text("No Donations Found"),
              );
            }

            return (snapshot.data!.docs.isEmpty)
                ? Center(
                    child: Text("No ${widget.tabTitle} donations!"),
                  )
                : ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: ((context, index) {
                      Donation donation = Donation.fromJson(
                          snapshot.data?.docs[index].data()
                              as Map<String, dynamic>);
                      String? donationId = snapshot.data?.docs[index].id;
                      return Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              size: screenWidth * 0.1,
                            ),
                            title: Text(
                              donation.donorName,
                              style: TextStyle(fontSize: screenWidth * 0.05),
                            ),
                            trailing: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(210, 237, 228, 1),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DonationDetails(
                                                  donation: donation,
                                                  donationId: donationId!,
                                                )));
                                  },
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    size: screenWidth * 0.08,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      );
                    }));
          })),
    );
  }
}
