import 'package:elbigay/screens/donor/donate_donor.dart';
import 'package:elbigay/screens/donor/homepage_donor.dart';
import 'package:elbigay/screens/donor/profile_donor.dart';
import 'package:flutter/material.dart';

class AdminNavbar extends StatefulWidget {
  const AdminNavbar({super.key});

  @override
  State<AdminNavbar> createState() => _AdminNavbarState();
}

class _AdminNavbarState extends State<AdminNavbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: const <Widget>[
            DonorHomepage(),
            DonatePage(),
            DonorProfilepage()
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
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const Icon(Icons.inventory)
                : const Icon(Icons.inventory_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? const Icon(Icons.person)
                : const Icon(Icons.person_outline),
            label: '',
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
