import 'package:elbigay/models/donation_drive_model.dart';
import 'package:elbigay/providers/auth_provider.dart';
import 'package:elbigay/providers/donation_drive_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateDeleteDonationDrive extends StatefulWidget {
  final DonationDrive donationDrive;
  final String? documentId;
  const UpdateDeleteDonationDrive(
      {super.key, required this.donationDrive, required this.documentId});

  @override
  State<UpdateDeleteDonationDrive> createState() =>
      _UpdateDeleteDonationDriveState();
}

class _UpdateDeleteDonationDriveState extends State<UpdateDeleteDonationDrive> {
  final _formKey = GlobalKey<FormState>();
  User? user;
  late String title;
  late String description;
  late DateTime date;
  late TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    user = context.watch<UserAuthProvider>().user;
    title = widget.donationDrive.title;
    description = widget.donationDrive.description;
    date = DateTime.parse(widget.donationDrive.date);
    dateController = TextEditingController(
        text:
            DateTime.parse(widget.donationDrive.date).toString().split(" ")[0]);

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
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                "Update Donation Drive",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w600),
              )
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
                controller: dateController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.calendar_today),
                  hintText: "Choose date",
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
                    dateController.text = selectedDate.toString().split(" ")[0];
                  } else {
                    date = DateTime.parse(dateController.text);
                  }
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                  child:
                      Container()), // to make sure that the create button is always at the bottom
              buttons
            ],
          ),
        ),
      ),
    );
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
            initialValue: widget.donationDrive.title,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Please enter title!";
              }
              return null;
            },
            onSaved: (val) => setState(() => title = val!),
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
            initialValue: widget.donationDrive.description,
            maxLines: 5,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Please enter description!";
              }
              return null;
            },
            onSaved: (val) => setState(() => description = val!),
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
                context.read<DonationDriveProvider>().editDonationDrive(
                    widget.documentId!, title, description, date.toString());
                Navigator.pop(context);
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
                  "Update",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              context
                  .read<DonationDriveProvider>()
                  .deleteDonationDrive(widget.documentId!);
              Navigator.pop(context);
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
                  "Delete",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Theme.of(context).primaryColor),
                  boxShadow: kElevationToShadow[2],
                ),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor),
                )),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      );
}
