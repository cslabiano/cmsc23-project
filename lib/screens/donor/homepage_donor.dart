import 'package:elbigay/widgets/org_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../models/donation_model.dart';

class DonorHomepage extends StatefulWidget {
  const DonorHomepage({super.key});

  @override
  State<DonorHomepage> createState() => _DonorHomepageState();
}

class _DonorHomepageState extends State<DonorHomepage> {
  final List<Donation> _donations = [
    Donation(
        image: 'assets/googlelogo.png',
        title: "title 1",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
    Donation(
        image: 'assets/googlelogo.png',
        title: "title 2",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
    Donation(
        image: 'assets/googlelogo.png',
        title: "title 3",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    "Hello Myndie!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(62, 180, 137, 1),
                        fontFamily: 'Lato',
                        fontSize: 27,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    "Where do you want to donate today",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(156, 157, 159, 1),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      height: 1,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: -4,
                        blurRadius: 3,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _donations.length,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          SizedBox(height: 20),
                          OrgCard(donation: _donations[index])
                        ]);
                      }),
                ),
                SizedBox(height: screenHeight * 0.1)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
