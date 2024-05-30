import 'dart:io';

import 'package:elbigay/models/donation_drive_model.dart';
import 'package:elbigay/providers/auth_provider.dart';
import 'package:elbigay/providers/donation_drive_provider.dart';
import 'package:elbigay/util/image_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddDonationDrive extends StatefulWidget {
  const AddDonationDrive({super.key});

  @override
  State<AddDonationDrive> createState() => _AddDonationDriveState();
}

class _AddDonationDriveState extends State<AddDonationDrive> {
  final _formKey = GlobalKey<FormState>();
  late DonationDrive donationDrive;
  User? user;
  String? title;
  String? description;
  DateTime? date;
  File? selectedImage;
  String imagePath = "none";

  void setImage() async {
    XFile? xfile = await getImage(context);
    File img = File(xfile!.path);
    setState(() {
      selectedImage = img;
    });
  }

  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    user = context.watch<UserAuthProvider>().user;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Create New Donation Drive",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  titleField,
                  descriptionField,
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          "Closing Date",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        const Text(
                          '*',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.calendar_today),
                      hintText: "Choose date",
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    readOnly: true,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please pick a date";
                      }
                      return null;
                    },
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100));
                      if (selectedDate != null) {
                        date = selectedDate;
                        _dateController.text =
                            selectedDate.toString().split(" ")[0];
                      }
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          "Upload image",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        const Text(
                          '*',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
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
                            color: Theme.of(context).colorScheme.primary,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(12),
                            padding: const EdgeInsets.all(6),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                width: double.infinity,
                                height: screenHeight * 0.15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.photo_library,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: screenWidth * 0.15),
                                        Text("Take a photo or browse",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold)),
                                      ]),
                                ),
                              ),
                            ),
                          )
                        : DottedBorder(
                            dashPattern: const [7, 3],
                            strokeWidth: 2,
                            color: Theme.of(context).colorScheme.primary,
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
                  Expanded(
                      child:
                          Container()), // to make sure that the create button is always at the bottom
                  buttons,
                ],
              )),
        ));
  }

  Widget get titleField => Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  "Title",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const Text(
                  '*',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Please enter title!";
              }
              return null;
            },
            onSaved: (val) => setState(() => title = val),
            decoration: InputDecoration(
              hintText: "Enter donation drive title",
              hintStyle: TextStyle(
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      );

  Widget get descriptionField => Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  "Description",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const Text(
                  '*',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            maxLines: 5,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Please enter description!";
              }
              return null;
            },
            onSaved: (val) => setState(() => description = val),
            decoration: InputDecoration(
              hintText: "Enter donation drive description",
              hintStyle: TextStyle(
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      );

  Widget get buttons => Column(
        children: [
          InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (selectedImage != null) {
                  imagePath = uploadFileForUser(selectedImage!);
                  context.read<DonationDriveProvider>().addDonationDrive(
                      DonationDrive(
                          userId: user!.uid,
                          title: title!,
                          description: description!,
                          date: date!.toString(),
                          imagePath: imagePath));
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Upload an Image!")));
                }
              }
            },
            child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromRGBO(14, 198, 178, 1),
                        Color.fromRGBO(37, 212, 147, 1)
                      ]),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Theme.of(context).primaryColor),
                  boxShadow: kElevationToShadow[2],
                ),
                child: const Text(
                  "Create",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // InkWell(
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          //   child: Container(
          //       height: 50,
          //       alignment: Alignment.center,
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(15),
          //         border: Border.all(color: Theme.of(context).primaryColor),
          //         boxShadow: kElevationToShadow[2],
          //       ),
          //       child: Text(
          //         "Cancel",
          //         style: TextStyle(
          //             fontSize: 20, color: Theme.of(context).primaryColor),
          //       )),
          // ),
          const SizedBox(
            height: 20,
          )
        ],
      );
}
