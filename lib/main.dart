import 'package:elbigay/screens/donor/organization_details.dart';
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
import '/screens/donor/donate_donor.dart';
import '/screens/entry/signup_org.dart';
import '/screens/entry/signup_option.dart';
import '/screens/donor/homepage_donor.dart';
import '/screens/donor/profile_donor.dart';
import '/screens/organization/add_donation_drive_organization.dart';
import 'screens/organization/donation_drive_organization.dart';
import '/screens/organization/homepage_organization.dart';
import '/screens/organization/profile_organization.dart';
import '/screens/donor/donation_drive_details.dart';
import 'package:elbigay/screens/donor/receipt.dart';
import '/screens/donor/donor_donations.dart';

//import navbars
import 'navbars/navbar_donor.dart';
import '/navbars/navbar_org.dart';
// import '/navbars/navbar_admin.dart';

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
        onGenerateRoute: (settings) {
          if (settings.name == '/donor_receiptpage') {
            final id = settings.arguments as String;
            return MaterialPageRoute(builder: (context) {
              return ReceiptPage(id: id);
            });
          }

          if (settings.name == '/donor_donatepage') {
            final orgId = settings.arguments as String;
            return MaterialPageRoute(builder: (context) {
              return DonatePage(orgId: orgId);
            });
          }

          if (settings.name == '/organization_details') {
            final orgId = settings.arguments as String;
            return MaterialPageRoute(builder: (context) {
              return OrganizationDetails(orgId: orgId);
            });
          }
        },
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
          '/donation_drive_details': (context) => const DonationDriveDetails(),
          '/organization_navbar': (context) => const OrgNavbar(),
          '/organization_homepage': (context) => const OrganizationHomepage(),
          '/organization_profile': (context) => const OrganizationProfile(),
          '/organization_donation': (context) =>
              const OrganizationDonationDrive(),
          '/add_donation_drive': (context) => const AddDonationDrive(),
          // '/admin_navbar': (context) => const AdminNavbar(),
        });
  }
}
