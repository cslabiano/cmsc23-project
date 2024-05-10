// import 'package:flutter/material.dart';

// class AppBottomNavigationBar extends StatefulWidget {
//   const AppBottomNavigationBar({super.key});

//   @override
//   State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
// }

// class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
//   int _selectedIndex = 0;

//   // void _onItemTapped(int index) {
//   //   setState(() {
//   //     _selectedIndex = index;
//   //   });
//   // }

//   // static const TextStyle optionStyle =
//   //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: IndexedStack(
//           index: _selectedIndex,
//           children: const <Widget>[
//             MainScreen(),
//             TranslationScreen(),
//             ProfilePageScreen(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: _selectedIndex == 0
//                 ? const Icon(Icons.home)
//                 : const Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: _selectedIndex == 1
//                 ? const Icon(Icons.back_hand)
//                 : const Icon(Icons.back_hand_outlined),
//             label: 'Translate',
//           ),
//           BottomNavigationBarItem(
//             icon: _selectedIndex == 2
//                 ? const Icon(Icons.person)
//                 : const Icon(Icons.person_outline),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: (int index) {
//           setState(
//             () {
//               _selectedIndex = index;
//             },
//           );
//         },
//       ),
//     );
//   }
// }
