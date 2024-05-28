import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/models/donor_donation_model.dart';
import 'package:elbigay/providers/donation_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiptPage extends StatefulWidget {
  final String id;
  const ReceiptPage({required this.id, super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  String? qrData;

  Widget summaryRow(String label, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ),
        Expanded(
            child: Text(value,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<DonationProvider>().fetchDonation(widget.id);
    Stream<QuerySnapshot> donoStream =
        context.watch<DonationProvider>().donoStream;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          leading: BackButton(color: Theme.of(context).primaryColor),
          title: Text("Donation Details",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor))),
      body: StreamBuilder(
        stream: donoStream,
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
              Donation donation = Donation.fromJson(
                  snapshot.data?.docs[index].data() as Map<String, dynamic>);
              String date = donation.dateTime;
              DateTime datetime = DateTime.parse(date);
              String formattedDate = DateFormat('MMMM d, y').format(datetime);
              String formattedTime = DateFormat("jm").format(datetime);
              return Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: QrImageView(
                            data: widget.id,
                            version: QrVersions.auto,
                            gapless: false,
                            size: 270),
                      ),
                      SizedBox(height: 15),
                      Divider(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Column(
                          children: [
                            summaryRow("Name", donation.donorName),
                            SizedBox(height: 8),
                            summaryRow("Status", donation.status),
                            SizedBox(height: 8),
                            summaryRow("Date", formattedDate),
                            SizedBox(height: 8),
                            summaryRow("Time", formattedTime),
                            SizedBox(height: 8),
                            summaryRow(
                                "Location", "Org Address or smthng smthng"),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Divider(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      Text(
                        "Please show this receipt to the organizers to confirm your donation. Make sure that the details in this receipt is correct.",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        title: Text(
                          "Cancel Donation",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {},
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ]),
              );
            }),
          );
        }),
      ),
    );
  }
}
