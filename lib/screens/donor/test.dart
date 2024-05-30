import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/models/donor_donation_model.dart';
import 'package:elbigay/providers/donation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    context
        .watch<DonationProvider>()
        .fetchDonationsDonor("Y8aHcvr6ZqgMQm2Bm9ryC105dnH2", "Pending");
    Stream<QuerySnapshot> donoStream =
        context.watch<DonationProvider>().donoStream;
    return StreamBuilder(
        stream: donoStream,
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
              child: Text("No Todos Found"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: ((context, index) {
              Donation dono = Donation.fromJson(
                  snapshot.data?.docs[index].data() as Map<String, dynamic>);

              return Text(dono.donorName);
            }),
          );
        });
  }
}
