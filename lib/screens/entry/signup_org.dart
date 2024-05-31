import 'dart:io';

import 'package:elbigay/util/image_util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '/screens/entry/textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../models/org_model.dart';

class SignUpOrg extends StatefulWidget {
  const SignUpOrg({super.key});

  @override
  State<SignUpOrg> createState() => _SignUpOrgState();
}

class _SignUpOrgState extends State<SignUpOrg> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> addressControllers = [TextEditingController()];
  late Org org;
  String usertype = "org";
  late String email;
  late String orgname;
  late String uname;
  late String imageProofPath;
  File? selectedImage;
  late String password;
  late String contact;
  late List<String> address;

  void setImage() async {
    XFile? xfile = await getImage(context);
    File img = File(xfile!.path);
    setState(() {
      selectedImage = img;
    });
  }

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
                  child: Form(
                    key: _formKey,
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // input fields for email and password
                                InputField(
                                    callback: (String val) => email = val,
                                    text: "email",
                                    label: "email",
                                    type: "string"),
                                const SizedBox(height: 12),
                                InputField(
                                    callback: (String val) => orgname = val,
                                    text: "organization name",
                                    label: "org name",
                                    type: "String"),
                                const SizedBox(height: 12),

                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Proof of legitimacy",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setImage();
                                  },
                                  child: selectedImage == null
                                      ? DottedBorder(
                                          dashPattern: const [7, 3],
                                          strokeWidth: 2,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          borderType: BorderType.RRect,
                                          radius: const Radius.circular(12),
                                          padding: const EdgeInsets.all(6),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(12)),
                                            child: Container(
                                              width: double.infinity,
                                              height: screenHeight * 0.15,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Center(
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(Icons.upload,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          size: screenWidth *
                                                              0.15),
                                                      Text("Browse",
                                                          style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      const Text(
                                                          "File supported: .png & .jpg"),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                        )
                                      : DottedBorder(
                                          dashPattern: const [7, 3],
                                          strokeWidth: 2,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          borderType: BorderType.RRect,
                                          radius: const Radius.circular(12),
                                          padding: const EdgeInsets.all(6),
                                          child: SizedBox(
                                            width: double.infinity,
                                            height: screenHeight * 0.15,
                                            child: ClipRRect(
                                              child: Image.file(selectedImage!),
                                            ),
                                          ),
                                        ),
                                ),

                                const SizedBox(height: 12),
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
                                const SizedBox(height: 12),
                                InputField(
                                    callback: (String val) => contact = val,
                                    text: "contact no.",
                                    label: "number",
                                    type: "String"),
                                const SizedBox(height: 12),

                                // first address field
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Address/es",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                InputField(
                                  callback: (String val) {
                                    addressControllers[0].text = val;
                                  },
                                  text: "address",
                                  label: "address",
                                  type: "address",
                                  key: ValueKey(addressControllers[0]),
                                ),
                                const SizedBox(height: 12),

                                // dynamically added address fields
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
                                              callback: (String val) {
                                                addressControllers[index + 1]
                                                    .text = val;
                                              },
                                              text: "address",
                                              label: "address",
                                              type: "address",
                                              key: ValueKey(addressControllers[
                                                  index + 1]),
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
                                          borderRadius:
                                              BorderRadius.circular(8)),
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

                                // sign up button
                                SizedBox(
                                  width: double.infinity,
                                  height: 47,
                                  child: FilledButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        if (selectedImage != null) {
                                          imageProofPath = uploadProof(
                                              selectedImage!, uname);
                                          // collect addresses
                                          address = addressControllers
                                              .map((controller) =>
                                                  controller.text)
                                              .toList();

                                          org = Org(
                                              usertype: usertype,
                                              email: email,
                                              orgname: orgname,
                                              uname: uname,
                                              imageProofPath: imageProofPath,
                                              contact: contact,
                                              address: address,
                                              isVerified: false,
                                              isOpen: false);

                                          await context
                                              .read<UserAuthProvider>()
                                              .authService
                                              .signUpOrg(org, password);

                                          if (context.mounted) {
                                            print(
                                                "%%%%%%%%%%%%%%%%%%%%%%5\nsignup");
                                            Navigator.pushNamed(context,
                                                '/organization_navbar');
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "Please upload proof!")));
                                        }
                                      }
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
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
