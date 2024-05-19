import 'package:flutter/material.dart';

// import screens
import '/screens/splash.dart';
import '/screens/entry/sign_in.dart';
import '/screens/entry/signup_donor.dart';
import '/screens/entry/signup_org.dart';
import '/screens/entry/signup_option.dart';
import '/widgets/navbar_donor.dart';
import '/screens/donor/homepage_donor.dart';
import '/screens/donor/profile_donor.dart';
import '/screens/organization/donation_organization.dart';
import '/screens/organization/homepage_organization.dart';
import '/screens/organization/profile_organization.dart';

import 'package:elbigay/widgets/navbar_org.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: const ColorScheme.light(
            background: Colors.white,
            onBackground: Colors.black,
            primary: Color.fromRGBO(62, 180, 137, 1),
            secondary: Color.fromRGBO(34, 38, 66, 1),
            tertiary: Color.fromRGBO(156, 157, 150, 1),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Splash(),
          '/signin': (context) => const SignIn(),
          '/signup_donor': (context) => const SignUpDonor(),
          '/signup_org': (context) => const SignUpOrg(),
          '/signup_option': (context) => const SignUpOption(),
          '/donor_navbar': (context) => const DonorNavbar(),
          '/donor_homepage': (context) => const DonorHomepage(),
          '/donor_profilepage': (context) => const DonorProfilepage(),
          '/organization_navbar': (context) => const OrgNavbar(),
          '/organization_homepage': (context) => const OrganizationHomepage(),
          '/organization_profile': (context) => const OrganizationProfile(),
          '/organization_donation': (context) => const OrganizationDonation(),
        });
  }
}
