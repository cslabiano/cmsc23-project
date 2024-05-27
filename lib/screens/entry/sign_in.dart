import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screens/entry/textfield.dart';
import '../../providers/auth_provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  late String uname;
  late String password;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(14, 198, 178, 1),
            Color.fromRGBO(37, 212, 147, 1)
          ],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          margin: EdgeInsets.only(top: screenHeight * 0.15),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 50, left: 20, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.1,
                                  fontWeight: FontWeight.w900,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // input fields for username and password
                            InputField(
                                callback: (String val) => uname = val,
                                text: "username",
                                label: "uname",
                                type: "String"),
                            const SizedBox(height: 12),
                            InputField(
                                callback: (String val) => password = val,
                                text: "password",
                                label: "password",
                                type: "password"),
                            SizedBox(height: screenHeight * 0.06),

                            // error message display
                            errorMessage != null
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        errorMessage!,
                                        style: const TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),

                            // sign in button
                            SizedBox(
                              width: double.infinity,
                              height: 47,
                              child: FilledButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    // call sign-in method and handle errors
                                    String? result = await context
                                        .read<UserAuthProvider>()
                                        .authService
                                        .signIn(uname, password);
                                    if (result != null) {
                                      setState(() {
                                        errorMessage = result;
                                      });
                                    } else {
                                      if (context.mounted) {
                                        navigateToHome(context);
                                      }
                                    }
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Theme.of(context).primaryColor,
                                  ),
                                  shadowColor: MaterialStateProperty.all<Color>(
                                    Colors.black.withOpacity(1),
                                  ),
                                  elevation:
                                      MaterialStateProperty.all<double>(5),
                                ),
                                child: const Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            // divider
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                Text(
                                  " or ",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),

                            // sign in with google button
                            SizedBox(
                              width: double.infinity,
                              height: 47,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Theme.of(context).colorScheme.background,
                                  ),
                                  shadowColor: MaterialStateProperty.all<Color>(
                                    Colors.black.withOpacity(1),
                                  ),
                                  elevation:
                                      MaterialStateProperty.all<double>(5),
                                  side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/googlelogo.png",
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      "Sign in with Google",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(71, 71, 71, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account yet?",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup_option');
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToHome(BuildContext context) async {
    final userAuthProvider = context.read<UserAuthProvider>();
    final userType = await userAuthProvider.authService.getUsertype(uname);
    if (userType == 'donor') {
      Navigator.pushNamed(context, '/donor_navbar');
    } else if (userType == 'org') {
      Navigator.pushNamed(context, '/organization_navbar');
    } else if (userType == 'admin') {
      Navigator.pushNamed(context, '/admin_navbar');
    }
  }
}
