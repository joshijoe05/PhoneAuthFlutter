// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phoneauth/pages/country_phone.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../constants/colors.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String dropdownvalue = "English";
  var locale = Locale('en', 'US');
  List<String> values = ["English", "Hindi", "Telugu"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            child: WaveWidget(
              waveFrequency: 1.6,
              config: CustomConfig(
                  colors: [lightBlue, blue.withOpacity(0.7)],
                  durations: [5000, 6000],
                  heightPercentages: [0.75, 0.76]),
              size: Size(double.infinity, double.infinity),
              waveAmplitude: 0,
            ),
          ),
          Positioned.fill(
            top: 180,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 55,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "select_lang".tr,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "You can change the language".tr,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      color: grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                  Text(
                    "at any time.".tr,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      color: grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: blackMain, width: 1)),
                    width: MediaQuery.sizeOf(context).width - 120,
                    height: 50,
                    child: DropdownButton(
                      isExpanded: true,
                      isDense: true,
                      value: dropdownvalue,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: blackMain,
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: blackMain,
                      ),
                      items: [
                        DropdownMenuItem<String>(
                          onTap: () {
                            setState(() {
                              locale = Locale('en', 'US');
                            });
                          },
                          value: "English",
                          child: Text(
                            "English".tr,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: blackMain,
                            )),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          onTap: () {
                            setState(() {
                              var locale = Locale('hi', 'IN');
                            });
                          },
                          value: "Hindi",
                          child: Text(
                            "Hindi".tr,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: blackMain,
                            )),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          onTap: () {
                            setState(() {
                              var locale = Locale('te', 'IN');
                            });
                          },
                          value: "Telugu".tr,
                          child: Text(
                            "Telugu",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: blackMain,
                            )),
                          ),
                        )
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          dropdownvalue = value!;
                          Get.updateLocale(locale);
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    width: MediaQuery.sizeOf(context).width - 120,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(blue.withOpacity(1)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero)),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 14))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PhonePicker()));
                        },
                        child: Text(
                          "NEXT".tr,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
