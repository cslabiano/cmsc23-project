import 'package:flutter/material.dart';
import '/screens/entry/textfield.dart';
import 'package:dotted_border/dotted_border.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> addressControllers = [TextEditingController()];
  String? email;
  String? fname;
  String? lname;
  String? uname;
  String? password;
  int? contact;
  List<String>? address;

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  margin: EdgeInsets.only(top: screenHeight * 0.08),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 20, right: 20),
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
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // input fields for email and password
                              InputField(
                                  callback: (String val) {}, text: "email"),
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
                              InputField(
                                  callback: (String val) {}, text: "username"),
                              const SizedBox(height: 12),
                              InputField(
                                  callback: (String val) {}, text: "password"),
                              const SizedBox(height: 12),
                              InputField(
                                  callback: (String val) {},
                                  text: "contact no."),
                              const SizedBox(height: 12),

                              // first address field
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Address",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              InputField(
                                callback: (String val) {},
                                text: "address",
                                key: ValueKey(addressControllers[0]),
                              ),
                              const SizedBox(height: 12),

                              // Dynamically added address fields
                              Column(
                                children: List.generate(
                                  addressControllers.length - 1,
                                  (index) => Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 12.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: InputField(
                                            callback: (String val) {},
                                            text: "address",
                                            key: ValueKey(
                                                addressControllers[index + 1]),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.remove_circle,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary),
                                          onPressed: () {
                                            setState(() {
                                              addressControllers
                                                  .removeAt(index + 1);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              DottedBorder(
                                dashPattern: const [5, 3],
                                color: Theme.of(context).colorScheme.tertiary,
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(12),
                                padding: const EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                  child: Container(
                                    width: double.infinity,
                                    height: screenHeight * 0.05,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: IconButton(
                                      icon: Icon(Icons.add,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                      onPressed: () {
                                        setState(() {
                                          addressControllers
                                              .add(TextEditingController());
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.03),

                              // Sign up button
                              SizedBox(
                                width: double.infinity,
                                height: 47,
                                child: FilledButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/donor_navbar');
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Theme.of(context).primaryColor,
                                    ),
                                    shadowColor:
                                        MaterialStateProperty.all<Color>(
                                      Colors.black.withOpacity(1),
                                    ),
                                    elevation:
                                        MaterialStateProperty.all<double>(5),
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/signin');
                                        },
                                        child: Text(
                                          "Sign in",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
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
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
