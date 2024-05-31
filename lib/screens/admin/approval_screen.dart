import 'package:cloud_firestore/cloud_firestore.dart';
import '/screens/admin/org_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/admin_provider.dart';
// import '../../models/donor_donation_model.dart';

class ApprovalScreen extends StatefulWidget {
  const ApprovalScreen({super.key});

  @override
  State<ApprovalScreen> createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    context.watch<AdminProvider>().fetchUnverifiedOrgs();
    Stream<QuerySnapshot> orgStream = context.watch<AdminProvider>().uStream;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: -4,
                      blurRadius: 3,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AdminOrgCard(organizations: orgStream),
            ],
          ),
        ),
      ),
    );
  }
}
