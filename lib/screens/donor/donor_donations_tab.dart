// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/models/donor_donation_model.dart';
import 'package:elbigay/models/org_model.dart';
import 'package:elbigay/providers/auth_provider.dart';
import 'package:elbigay/providers/donation_provider.dart';
import 'package:elbigay/providers/org_provider.dart';
import 'package:elbigay/screens/donor/receipt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonorDonationsTab extends StatefulWidget {
  final String tabTitle;
  const DonorDonationsTab({super.key, required this.tabTitle});

  @override
  State<DonorDonationsTab> createState() => _DonorDonationsTabState();
}

class _DonorDonationsTabState extends State<DonorDonationsTab> {
  User? user;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    user = context.read<UserAuthProvider>().user;
    context
        .watch<DonationProvider>()
        .fetchDonationsDonor(user!.uid, widget.tabTitle);
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

            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: ((context, index) {
                  Donation donation = Donation.fromJson(
                      snapshot.data?.docs[index].data()
                          as Map<String, dynamic>);

                  Org? organization =
                      context.watch<OrganizationProvider>().organization;
                  if (organization == null && user != null) {
                    context
                        .read<OrganizationProvider>()
                        .getOrg(donation.orgId!);
                  }
                  String? orgId = snapshot.data?.docs[index].id;
                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.inventory_2,
                          size: screenWidth * 0.1,
                        ),
                        title: Text(
                          organization!.uname,
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
                                        builder: (context) => ReceiptPage(
                                              itemId: donation.id as String,
                                              orgId: orgId as String,
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
