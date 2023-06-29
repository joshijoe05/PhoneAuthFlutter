// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool selectfirst = false;
  bool selectsecond = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
              top: 120,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        "Please select your profile",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                      SizedBox(height: 25),
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Card(
                          margin: EdgeInsets.zero,
                          color: Colors.white,
                          elevation: 0,
                          child: ListTile(
                            title: Text(
                              "Shipper",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: blackMain,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20)),
                            ),
                            subtitle: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15)),
                            ),
                            onTap: () {
                              setState(() {
                                selectfirst = !selectfirst;
                                selectsecond = false;
                              });
                            },
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 27),
                            leading: Container(
                              width: 100,
                              child: Row(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors
                                            .black, // Set the desired color here
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        CupertinoIcons.circle_fill,
                                        size: 20,
                                        color:
                                            selectfirst ? blue : Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                      width: 30,
                                      child: Icon(
                                        CupertinoIcons.building_2_fill,
                                        size: 60,
                                        color: Colors.black,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Card(
                          margin: EdgeInsets.zero,
                          color: Colors.white,
                          elevation: 0,
                          child: ListTile(
                            title: Text(
                              "Transporter",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: blackMain,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20)),
                            ),
                            subtitle: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15)),
                            ),
                            onTap: () {
                              setState(() {
                                selectfirst = false;
                                selectsecond = !selectsecond;
                              });
                            },
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 27),
                            leading: Container(
                              width: 100,
                              child: Row(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors
                                            .black, // Set the desired color here
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        CupertinoIcons.circle_fill,
                                        size: 20,
                                        color:
                                            selectsecond ? blue : Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                      width: 30,
                                      child: Icon(
                                        Icons.local_shipping_outlined,
                                        size: 60,
                                        color: Colors.black,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    blue.withOpacity(1)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(vertical: 17))),
                            onPressed: () {},
                            child: Text(
                              "CONTINUE",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                            )),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
