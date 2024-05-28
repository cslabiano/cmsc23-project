import 'package:elbigay/screens/organization/donation_drive_organization.dart';
import 'package:elbigay/screens/organization/homepage_organization.dart';
import 'package:flutter/material.dart';
import '../screens/organization/profile_organization.dart';

class OrgNavbar extends StatefulWidget {
  const OrgNavbar({super.key});

  @override
  State<OrgNavbar> createState() => _OrgNavbarState();
}

class _OrgNavbarState extends State<OrgNavbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
