import 'package:elbigay/models/donation_model.dart';
import 'package:flutter/material.dart';

class OrgCard extends StatefulWidget {
  final Donation donation;
  const OrgCard({required this.donation, super.key});

  @override
  State<OrgCard> createState() => _OrgCardState();
}

class _OrgCardState extends State<OrgCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(children: [
      InkWell(
        onTap: () {
          print("Tapped");
        },
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
          height: screenHeight * 0.2,
          width: screenWidth * 0.85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.asset(
              widget.donation.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          print("Tapped");
        },
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: Container(
          height: screenHeight * 0.069,
          width: screenWidth * 0.85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.white,
              boxShadow: kElevationToShadow[2]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                child: Text(
                  widget.donation.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color.fromRGBO(62, 180, 137, 1),
                    fontFamily: 'Lato',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 20, 10),
                child: Text(
                  widget.donation.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: Color.fromRGBO(34, 38, 66, 1),
                    fontFamily: 'Lato',
                    fontSize: 8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
