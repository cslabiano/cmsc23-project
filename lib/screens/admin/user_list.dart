// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import '/screens/organization/donation_details_organization.dart';
import '/models/org_model.dart';
import '/models/donor_model.dart';
import '/providers/admin_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  final String tabTitle;
  const UserList({super.key, required this.tabTitle});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  User? user;

  @override
  Widget build(BuildContext context) {
    context.watch<AdminProvider>().fetchAllDonor();

    Stream<QuerySnapshot> donorStream =
        context.watch<AdminProvider>().donorStream;

    return (widget.tabTitle == 'Organizations')
        ? const OrganizationList()
        : const DonorList();
  }
}

class OrganizationList extends StatelessWidget {
  const OrganizationList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    context.watch<AdminProvider>().fetchVerifiedOrgs();
    Stream<QuerySnapshot> orgStream = context.watch<AdminProvider>().vStream;
    return Expanded(
      child: StreamBuilder(
          stream: orgStream,
          builder: ((context, snapshot) {
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
                  Org org = Org.fromJson(snapshot.data?.docs[index].data()
                      as Map<String, dynamic>);

                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.language,
                            size: screenWidth * 0.1,
                            color: Theme.of(context).colorScheme.secondary),
                        title: Text(
                          org.orgname,
                          style: TextStyle(fontSize: screenWidth * 0.05),
                        ),
                        trailing: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(210, 237, 228, 1),
                            ),
                            child: InkWell(
                              onTap: () {},
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

class DonorList extends StatelessWidget {
  const DonorList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    context.watch<AdminProvider>().fetchAllDonor();
    Stream<QuerySnapshot> donorStream =
        context.watch<AdminProvider>().donorStream;
    return Expanded(
      child: StreamBuilder(
          stream: donorStream,
          builder: ((context, snapshot) {
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
                  Donor donor = Donor.fromJson(snapshot.data?.docs[index].data()
                      as Map<String, dynamic>);

                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.account_circle,
                            size: screenWidth * 0.1,
                            color: Theme.of(context).colorScheme.secondary),
                        title: Text(
                          "${donor.fname} ${donor.lname}",
                          style: TextStyle(fontSize: screenWidth * 0.05),
                        ),
                        trailing: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(210, 237, 228, 1),
                            ),
                            child: InkWell(
                              onTap: () {},
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
