import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/admin_provider.dart';

class ApprovalPage extends StatefulWidget {
  const ApprovalPage({super.key});

  @override
  State<ApprovalPage> createState() => _ApprovalPageState();
}

class _ApprovalPageState extends State<ApprovalPage> {
  // User? user;

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // user = context.read<UserAuthProvider>().user;
    // context
    //     .watch<AdminProvider>()
    //     .fetchDonationsOrg(user!.uid);
    Stream<QuerySnapshot> aStream = context.watch<AdminProvider>().aStream;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: screenHeight * 0.15,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                Color.fromRGBO(14, 198, 178, 1),
                Color.fromRGBO(37, 212, 147, 1)
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Good day, Admin!",
                  style: TextStyle(
                      color: Colors.white, fontSize: screenWidth * 0.06),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Here are the donations to you...",
                  style: TextStyle(
                      color: Colors.white, fontSize: screenWidth * 0.045),
                ),
              ),
              SizedBox(
                height: 10,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(157, 214, 193, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Expanded(
        child: StreamBuilder(
          stream: aStream,
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
                child: Text("No Organizations for approval ound"),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: ((context, index) {
                // Donation donation = Donation.fromJson(
                //     snapshot.data?.docs[index].data() as Map<String, dynamic>);
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        size: screenWidth * 0.1,
                      ),
                      title: Text(
                        'donation.donorName',
                        style: TextStyle(fontSize: screenWidth * 0.05),
                      ),
                      trailing: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(210, 237, 228, 1),
                          ),
                          child: InkWell(
                            onTap: () {
                              print("Tapped");
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
                    ),
                  ],
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}
