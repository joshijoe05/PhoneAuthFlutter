// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phoneauth/pages/profile_select.dart';
import 'package:phoneauth/pages/verify_phone.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:country_picker/country_picker.dart';
import '../constants/colors.dart';

class PhonePicker extends StatefulWidget {
  const PhonePicker({super.key});

  @override
  State<PhonePicker> createState() => _PhonePickerState();
}

class _PhonePickerState extends State<PhonePicker> {
  final TextEditingController phoneController = TextEditingController();
  String? _verificationId;

  Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: WaveWidget(
                    waveFrequency: 1.6,
                    config: CustomConfig(
                        colors: [lightBlue, blue.withOpacity(0.7)],
                        durations: [5000, 6000],
                        heightPercentages: [0.70, 0.71]),
                    size: Size(double.infinity, double.infinity),
                    waveAmplitude: 0,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Positioned.fill(
                    top: 100,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Text(
                            "Please enter your mobile number",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "You'll receive a 6 digit code",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              color: grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                          Text(
                            "to verify next.",
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color: blackMain,
                                      fontWeight: FontWeight.w700)),
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                              decoration: InputDecoration(
                                  hintText: "Mobile Number",
                                  hintStyle: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: grey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.zero),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.zero),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  prefixIcon: Container(
                                    padding: EdgeInsets.all(12),
                                    child: InkWell(
                                      onTap: () {
                                        showCountryPicker(
                                            context: context,
                                            countryListTheme:
                                                CountryListThemeData(
                                                    bottomSheetHeight: 500),
                                            onSelect: (value) {
                                              selectedCountry = value;
                                            });
                                      },
                                      child: Text(
                                        "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                fontSize: 20,
                                                color: blackMain,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              blue.withOpacity(1)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero)),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(vertical: 17))),
                                  onPressed: () {
                                    _verifyPhone();
                                  },
                                  child: Text(
                                    "CONTINUE",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white)),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+${selectedCountry.phoneCode}${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
                (route) => false);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Something went wrong !")));
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number')
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid Phone Number")));
        else
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Oops.. Verification Failed")));
      },
      codeSent: (verificationId, resendToken) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Please Wait... Verifying")));
        setState(() {
          _verificationId = verificationId;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    VerifyPhone(verificationId: _verificationId)));
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: Duration(seconds: 120),
    );
  }
}
