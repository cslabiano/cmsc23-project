import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/models/org_model.dart';
import 'package:elbigay/providers/donation_drive_provider.dart';
import 'package:elbigay/providers/org_provider.dart';
import 'package:elbigay/screens/organization/donation_drive_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApproveOrgView extends StatefulWidget {
  final String orgId;
  const ApproveOrgView({required this.orgId, super.key});

  @override
  State<ApproveOrgView> createState() => _ApproveOrgViewState();
}

class _ApproveOrgViewState extends State<ApproveOrgView> {
  Org? organization;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    context.watch<DonationDriveProvider>().fetchDonationDrives(widget.orgId);
    Stream<QuerySnapshot> donationDriveStream =
        context.watch<DonationDriveProvider>().donationDrives;

    context.watch<OrganizationProvider>().getOrgStream(widget.orgId);

    Stream<QuerySnapshot> orgStream = context.watch<OrganizationProvider>().org;

    return Scaffold(
        body: StreamBuilder(
            stream: orgStream,
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

              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data?.docs.length,
                itemBuilder: ((context, index) {
                  Org organization = Org.fromJson(snapshot.data?.docs[index]
                      .data() as Map<String, dynamic>);

                  return Column(
                    children: [
                      Stack(children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                Colors.black,
                              ],
                            ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height));
                          },
                          blendMode: BlendMode.darken,
                          child: Image.asset(
                            'assets/donation_drive.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.03,
                          left: screenWidth * 0.04,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Positioned(
                                child: Icon(Icons.arrow_back_ios_new,
                                    size: 20,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.22,
                          left: screenWidth * 0.04,
                          child: Text(organization.uname,
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        )
                      ]),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                              style: TextStyle(fontSize: 12),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Contact:",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: screenWidth * 0.05,
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  organization.contact,
                                  style:
                                      TextStyle(fontSize: screenWidth * 0.03),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                  size: screenWidth * 0.05,
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  organization.email,
                                  style:
                                      TextStyle(fontSize: screenWidth * 0.03),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: screenWidth * 0.05,
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  organization.address[0],
                                  style:
                                      TextStyle(fontSize: screenWidth * 0.03),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "Donation drives:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 230,
                        child: DonationDriveCard(
                            donationDrives: donationDriveStream),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: InkWell(
                                  // TODO: approve
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            Color.fromRGBO(14, 198, 178, 1),
                                            Color.fromRGBO(37, 212, 147, 1)
                                          ]),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: kElevationToShadow[2],
                                    ),
                                    child: const Text("Approve",
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20)
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
              );
            }));
  }
}
