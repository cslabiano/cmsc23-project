import 'package:elbigay/screens/donor/donate_donor.dart';
import 'package:elbigay/screens/donor/homepage_donor.dart';
import 'package:elbigay/screens/donor/profile_donor.dart';
import 'package:flutter/material.dart';

class DonorNavbar extends StatefulWidget {
  const DonorNavbar({super.key});

  @override
  State<DonorNavbar> createState() => _DonorNavbarState();
}

class _DonorNavbarState extends State<DonorNavbar> {
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const Icon(Icons.inventory)
                : const Icon(Icons.inventory_outlined),
            label: 'Donations',
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
