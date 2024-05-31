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
  final String itemId;
  final String orgId;
  const ReceiptPage({required this.itemId, required this.orgId, super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  String? qrData;
  bool showQR = false;
  bool cancelled = false;
  bool completed = false;

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
            child: Text(
          value,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<DonationProvider>().fetchDonation(widget.itemId);
    Stream<QuerySnapshot> donoStream =
        context.watch<DonationProvider>().donoStream;

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

          Donation donation = Donation.fromJson(
              snapshot.data?.docs[0].data() as Map<String, dynamic>);
          String date = donation.dateTime;
          DateTime datetime = DateTime.parse(date);
          String formattedDate = DateFormat('MMMM d, y').format(datetime);
          String formattedTime = DateFormat("jm").format(datetime);

          if (donation.modeOfDelivery == "Pickup" &&
              donation.status != "Pending") showQR = true;

          if (donation.status == "Cancelled") cancelled = true;
          if (donation.status == "Completed") completed = true;

          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(height: 20),
              showQR
                  ? Align(
                      alignment: Alignment.center,
                      child: QrImageView(
                          data: widget.itemId,
                          version: QrVersions.auto,
                          gapless: false,
                          size: 270),
                    )
                  : SizedBox(height: 180),
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
                    summaryRow("Mode of Delivery", donation.modeOfDelivery),
                    SizedBox(height: 8),
                    if (donation.modeOfDelivery == "Pickup")
                      summaryRow("Location", donation.address as String),
                  ],
                ),
              ),
              SizedBox(height: 22),
              Divider(
                color: Theme.of(context).colorScheme.tertiary,
              ),
              Text(
                "Please show this receipt to the organizers to confirm your donation. Make sure that the details in this receipt is correct.",
                style: TextStyle(color: Colors.grey, fontSize: 13),
                textAlign: TextAlign.center,
              ),
              Expanded(child: Container()),
              cancelled
                  ? Text("Donation Cancelled!",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))
                  : completed
                      ? Text("Donation Completed!",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20))
                      : InkWell(
                          onTap: () {
                            context.read<DonationProvider>().changeStatus(
                                donation.id as String,
                                "Cancelled",
                                widget.orgId);
                            setState(() {
                              cancelled = true;
                            });
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor),
                              boxShadow: kElevationToShadow[2],
                            ),
                            child: Text("Cancel",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColor)),
                          ),
                        ),
              SizedBox(height: 50),
            ]),
          );
        }),
      ),
    );
  }
}
