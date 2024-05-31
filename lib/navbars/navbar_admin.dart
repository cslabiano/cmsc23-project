import '/screens/admin/donor_list_tabs.dart';
import 'package:flutter/material.dart';
import '/screens/admin/admin_profile.dart';

class AdminNavbar extends StatefulWidget {
  const AdminNavbar({super.key});

  @override
  State<AdminNavbar> createState() => _AdminNavbarState();
}

class _AdminNavbarState extends State<AdminNavbar> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: const <Widget>[
            // DonationDriveList(),
            AdminProfile(),
            AdminProfile(),
            DonorListTabs(),
            AdminProfile(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Icon(Icons.verified)
                : const Icon(Icons.verified_outlined),
            label: 'For Approval',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const Icon(Icons.groups)
                : const Icon(Icons.groups_outlined),
            label: 'Organizations',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? const Icon(Icons.volunteer_activism)
                : const Icon(Icons.volunteer_activism_outlined),
            label: 'Donors',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Icon(Icons.account_circle_outlined)
                : const Icon(Icons.account_circle),
            label: 'Account',
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
