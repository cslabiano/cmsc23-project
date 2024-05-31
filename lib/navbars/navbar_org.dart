import 'package:elbigay/providers/auth_provider.dart';
import 'package:elbigay/providers/org_provider.dart';
import 'package:elbigay/screens/organization/donation_drive_organization.dart';
import 'package:elbigay/screens/organization/homepage_organization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/organization/profile_organization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/models/org_model.dart';

class OrgNavbar extends StatefulWidget {
  const OrgNavbar({super.key});

  @override
  State<OrgNavbar> createState() => _OrgNavbarState();
}

class _OrgNavbarState extends State<OrgNavbar> {
  User? user;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    user = context.read<UserAuthProvider>().user;
    Org? org = context.watch<OrganizationProvider>().organization;
    if (org == null && user != null) {
      context.read<OrganizationProvider>().getDetails(user!);
    }
    return (org!.isVerified == false)
        ? Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                      child: Text(
                    "Please wait until admin has approved your registration",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FilledButton(
                        onPressed: () async {
                          await context.read<UserAuthProvider>().signOut();
                          if (context.mounted) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/', (Route<dynamic> route) => false);
                          }
                        },
                        child: const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Okay",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),
                )
              ],
            ),
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: IndexedStack(
                index: _selectedIndex,
                children: const <Widget>[
                  OrganizationHomepage(),
                  OrganizationDonationDrive(),
                  OrganizationProfile(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: _selectedIndex == 0
                      ? const Icon(Icons.home)
                      : const Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: _selectedIndex == 1
                      ? const Icon(Icons.inventory_2)
                      : const Icon(Icons.inventory_2_outlined),
                  label: 'Donation Drives',
                ),
                BottomNavigationBarItem(
                  icon: _selectedIndex == 2
                      ? const Icon(Icons.person)
                      : const Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (int index) {
                setState(
                  () {
                    _selectedIndex = index;
                  },
                );
              },
            ),
          );
  }
}
