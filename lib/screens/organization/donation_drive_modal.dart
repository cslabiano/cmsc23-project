import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/models/donation_drive_model.dart';
import 'package:elbigay/providers/donation_drive_provider.dart';
import 'package:elbigay/providers/donation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonationDriveModal extends StatefulWidget {
  final String orgId;
  final String donationId;
  const DonationDriveModal(
      {super.key, required this.orgId, required this.donationId});

  @override
  State<DonationDriveModal> createState() => _DonationDriveModalState();
}

class _DonationDriveModalState extends State<DonationDriveModal> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    context.read<DonationDriveProvider>().fetchDonationDrives(widget.orgId);
    Stream<QuerySnapshot> donationDrives =
        context.watch<DonationDriveProvider>().donationDrives;

    return SimpleDialog(
      title: const Text("Link to donation drive"),
      children: [
        StreamBuilder(
            stream: donationDrives,
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
                  child: Text("No Donation Drives Found"),
                );
              }

              return (snapshot.data!.docs.isEmpty)
                  ? const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text("No donation drives found!"),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    )
                  : Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: ((context, index) {
                            DonationDrive donationDrive =
                                DonationDrive.fromJson(
                                    snapshot.data?.docs[index].data()
                                        as Map<String, dynamic>);
                            String? donationDriveId =
                                snapshot.data?.docs[index].id;
                            return InkWell(
                              onTap: () {
                                context
                                    .read<DonationProvider>()
                                    .linkDonationDrive(
                                        widget.donationId, donationDriveId!);
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                  leading: Icon(
                                    Icons.fiber_manual_record_outlined,
                                    size: screenWidth * 0.04,
                                  ),
                                  title: Text(donationDrive.title)),
                            );
                          }),
                        ),
                      ),
                    );
            })),
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Row(
            children: [
              Expanded(
                child: Container(),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
            ],
          ),
        )
      ],
    );
  }
}
