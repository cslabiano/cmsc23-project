import 'package:elbigay/providers/admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:elbigay/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

// import providers
import 'package:provider/provider.dart';
import '/providers/donation_provider.dart';
import '/providers/donor_provider.dart';
import '/providers/auth_provider.dart';
import '/providers/donation_drive_provider.dart';
import '/providers/org_provider.dart';
// import '/providers/admin_provider.dart';

// import screens
import '/screens/splash.dart';
import '/screens/entry/sign_in.dart';
import '/screens/entry/signup_donor.dart';
import '/screens/entry/signup_org.dart';
import '/screens/entry/signup_option.dart';
import '/screens/donor/homepage_donor.dart';
import '/screens/donor/profile_donor.dart';
import '/screens/organization/add_donation_drive_organization.dart';
import 'screens/organization/donation_drive_organization.dart';
import '/screens/organization/homepage_organization.dart';
import '/screens/organization/profile_organization.dart';
import '/screens/donor/donation_drive_details.dart';
import '/screens/donor/donor_donations.dart';
import 'screens/admin/admin_profile.dart';
// import '/screens/admin/approval_screen.dart';
// import '/screens/admin/donation_drive_list.dart';

//import navbars
import 'navbars/navbar_donor.dart';
import '/navbars/navbar_org.dart';
import '/navbars/navbar_admin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => UserAuthProvider())),
        ChangeNotifierProvider(create: ((context) => DonationProvider())),
        ChangeNotifierProvider(create: ((context) => DonorProvider())),
        ChangeNotifierProvider(create: ((context) => DonationDriveProvider())),
        ChangeNotifierProvider(create: ((context) => OrganizationProvider())),
        ChangeNotifierProvider(create: ((context) => AdminProvider()))
      ],
      child: const MainApp(),
    ),
  );
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
          '/donor_donations': (context) => const DonorDonations(),
          '/donor_homepage': (context) => const DonorHomepage(),
          '/donor_profilepage': (context) => const DonorProfilepage(),
          '/organization_navbar': (context) => const OrgNavbar(),
          '/organization_homepage': (context) => const OrganizationHomepage(),
          '/organization_profile': (context) => const OrganizationProfile(),
          '/organization_donation': (context) =>
              const OrganizationDonationDrive(),
          // '/update_delete_dontaion_drive': (context) =>
          //     UpdateDeleteDonationDrive(),
          '/add_donation_drive': (context) => const AddDonationDrive(),
          '/admin_navbar': (context) => const AdminNavbar(),
          '/admin_profile': (context) => const AdminProfile(),
        });
  }
}
