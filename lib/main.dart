import 'package:flutter/material.dart';

// import screens
import '/screens/splash.dart';

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
          // '/signin': (context) => const SignIn(),
          // '/signup': (context) => const SignUp(),
        });
  }
}
