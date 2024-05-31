import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbigay/screens/admin/approve_org_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/admin_provider.dart';
import '/models/org_model.dart';

class ApprovalScreen extends StatelessWidget {
  const ApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    context.watch<AdminProvider>().fetchUnverifiedOrgs();
    Stream<QuerySnapshot> orgStream = context.watch<AdminProvider>().uStream;
    return Scaffold(
      appBar: AppBar(
        title: Text("For Approval",
            style: TextStyle(color: Theme.of(context).primaryColor)),
        automaticallyImplyLeading: false,
      ),
      body: Expanded(
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
                                onTap: () {
                                  print(org.orgId);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AdminApproveOrg(orgId: org.orgId!),
                                      ));
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
      ),
    );
  }
}
