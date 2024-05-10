import 'package:flutter/material.dart';
import '/screens/entry/textfield.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                            "Sign up",
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
                        InputField(callback: (String val) {}, text: "email"),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.4,
                              child: InputField(
                                  callback: (String val) {},
                                  text: "first name"),
                            ),
                            const SizedBox(width: 12),
                            Align(
                              alignment: Alignment.topRight,
                              child: SizedBox(
                                width: screenWidth * 0.4,
                                child: InputField(
                                    callback: (String val) {},
                                    text: "last name"),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        InputField(callback: (String val) {}, text: "username"),
                        const SizedBox(height: 12),
                        InputField(callback: (String val) {}, text: "password"),
                        const SizedBox(height: 12),
                        InputField(
                            callback: (String val) {}, text: "contact no."),
                        const SizedBox(height: 12),
                        InputField(callback: (String val) {}, text: "address"),
                        const SizedBox(height: 12),
                        SizedBox(height: screenHeight * 0.06),

                        // Sign up button
                        SizedBox(
                          width: double.infinity,
                          height: 47,
                          child: FilledButton(
                            onPressed: () {},
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
                              "Sign up",
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

                        // Sign up with google button
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
                                  "Sign up with Google",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(71, 71, 71, 1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/signin');
                                  },
                                  child: Text(
                                    "Sign in",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
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
            ),
          ],
        ),
      ),
    );
  }
}
