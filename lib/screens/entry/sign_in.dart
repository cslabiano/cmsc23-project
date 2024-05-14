import 'package:flutter/material.dart';
import '/screens/entry/textfield.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        margin: EdgeInsets.only(top: screenHeight * 0.15),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
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
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // input fields for email and password
                        InputField(callback: (String val) {}, text: "username"),
                        const SizedBox(height: 12),
                        InputField(callback: (String val) {}, text: "password"),
                        SizedBox(height: screenHeight * 0.06),

                        // Sign in button
                        SizedBox(
                          width: double.infinity,
                          height: 47,
                          child: FilledButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/organization_navbar');
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor,
                              ),
                              shadowColor: MaterialStateProperty.all<Color>(
                                Colors.black.withOpacity(1),
                              ),
                              elevation: MaterialStateProperty.all<double>(5),
                            ),
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        // divider
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          children: [
                            Expanded(
                                child: Divider(
                              color: Theme.of(context).colorScheme.secondary,
                            )),
                            Text(" or ",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                            Expanded(
                                child: Divider(
                              color: Theme.of(context).colorScheme.secondary,
                            )),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        // Sign in with google button
                        SizedBox(
                          width: double.infinity,
                          height: 47,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.background,
                              ),
                              shadowColor: MaterialStateProperty.all<Color>(
                                Colors.black.withOpacity(1),
                              ),
                              elevation: MaterialStateProperty.all<double>(5),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                                    color: Theme.of(context).primaryColor),
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
                                      color: Color.fromRGBO(71, 71, 71, 1)),
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
                        Navigator.pushNamed(context, '/signup');
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
    );
  }
}
