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
          padding: EdgeInsets.only(right: 20, left: 30),
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
                        fontSize: 25,
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
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 6),
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
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
                          InkWell(
                            onTap: () {
                              print("Tapped");
                            },
                            child: Container(
                              height: screenHeight * 0.2,
                              width: screenWidth * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                child: Image.asset(
                                  _donations[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: screenHeight * 0.08,
                            width: screenWidth * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Colors.white,
                              boxShadow: kElevationToShadow[2],
                            ),
                            padding: EdgeInsets.fromLTRB(15, 5, 20, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _donations[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color.fromRGBO(62, 180, 137, 1),
                                    fontFamily: 'Lato',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  _donations[index].description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Color.fromRGBO(34, 38, 66, 1),
                                    fontFamily: 'Lato',
                                    fontSize: 8,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
