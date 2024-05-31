import 'package:elbigay/models/donor_donation_model.dart';
import 'package:elbigay/providers/auth_provider.dart';
import 'package:elbigay/providers/donation_provider.dart';
// import 'package:elbigay/providers/donation_provider.dart';
import 'package:elbigay/screens/organization/donation_drive_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonationDetails extends StatefulWidget {
  final Donation donation;
  final String donationId;
  const DonationDetails(
      {super.key, required this.donation, required this.donationId});

  @override
  State<DonationDetails> createState() => _DonationDetailsState();
}

class _DonationDetailsState extends State<DonationDetails> {
  User? user;
  final List<bool> _dropOff = [true, false];
  final List<bool> _pickUp = [false, true];
  late String? _selectedValue;

  List<DropdownMenuItem<String>> dropdownList = [
    const DropdownMenuItem(value: "Pending", child: Text("Pending")),
    const DropdownMenuItem(value: "Confirmed", child: Text("Confirmed")),
    const DropdownMenuItem(value: "Scheduled", child: Text("Scheduled")),
    const DropdownMenuItem(value: "Completed", child: Text("Completed")),
  ];

  @override
  void initState() {
    _selectedValue = widget.donation.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    user = context.watch<UserAuthProvider>().user;
    // _selectedValue = widget.donation.status;

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
                      "${widget.donation.donorName}'s Donation",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              width: screenWidth,
              height: screenHeight,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Item type:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: screenWidth * 0.045),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                    ),
                    child: Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.donation.itemType.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            leading: Icon(
                              Icons.fiber_manual_record_outlined,
                              size: screenWidth * 0.04,
                            ),
                            title: Text(
                              widget.donation.itemType[index],
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Mode of Delivery:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: screenWidth * 0.045),
                  ),
                  Align(
                    child: ToggleButtons(
                      isSelected: (widget.donation.modeOfDelivery == "Drop off")
                          ? _dropOff
                          : _pickUp,
                      selectedColor: Colors.white,
                      color: Colors.grey,
                      fillColor: Theme.of(context).primaryColor,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      borderRadius: BorderRadius.circular(20),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.15),
                          child: Text('Drop off',
                              style: TextStyle(fontSize: screenWidth * 0.04)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.15),
                          child: Text('Pickup',
                              style: TextStyle(fontSize: screenWidth * 0.04)),
                        ),
                      ],
                      onPressed: (int newIndex) {},
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Weight:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: screenWidth * 0.045),
                  ),
                  TextFormField(
                    readOnly: true,
                    initialValue: "${widget.donation.weight} kg",
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    (widget.donation.modeOfDelivery == "Drop off")
                        ? "Drop off Date and Time:"
                        : "Pickup Date and Time",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: screenWidth * 0.045),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: DateTime.parse(widget.donation.dateTime)
                              .toString()
                              .split(" ")[0],
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.calendar_today),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.tertiary,
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
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          initialValue: DateTime.parse(widget.donation.dateTime)
                              .toString()
                              .split(" ")[1],
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.timer_outlined),
                            hintText: "Choose time",
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
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          readOnly: true,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  (widget.donation.modeOfDelivery == "Drop off")
                      ? Container()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pickup Address:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: screenWidth * 0.045),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.donation.address,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Contact No.:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: screenWidth * 0.045),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.donation.contactNumber,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  (widget.donation.status == 'Cancelled')
                      ? Row(
                          children: [
                            Text(
                              "Donation Status: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: screenWidth * 0.045),
                            ),
                            Text(
                              widget.donation.status,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: screenWidth * 0.045),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Donation Status:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: screenWidth * 0.045),
                            ),
                            Row(
                              children: [
                                DropdownButton(
                                    value: _selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedValue = value;
                                      });
                                    },
                                    items: dropdownList),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          Color.fromRGBO(14, 198, 178, 1),
                                          Color.fromRGBO(37, 212, 147, 1)
                                        ]),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor),
                                    boxShadow: kElevationToShadow[2],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      context
                                          .read<DonationProvider>()
                                          .changeStatus(widget.donationId,
                                              _selectedValue!);
                                    },
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                  Expanded(
                    child: Container(),
                  ),
                  InkWell(
                    onTap: () {
                      if (widget.donation.donationDriveId == 'none') {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                DonationDriveModal(
                                  orgId: widget.donation.orgId,
                                  donationId: widget.donationId,
                                ));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              "Donation is already linked to a donation drive!"),
                        ));
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
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          boxShadow: kElevationToShadow[2],
                        ),
                        child: const Text(
                          "Link to Donation Drive",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              )),
        ));
  }
}
