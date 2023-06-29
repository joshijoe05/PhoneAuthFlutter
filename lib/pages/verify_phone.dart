// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phoneauth/pages/profile_select.dart';
import 'package:pinput/pinput.dart';
import '../constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyPhone extends StatefulWidget {
  // final phone;
  final verificationId;

  const VerifyPhone({super.key, required this.verificationId});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  late String otpCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: 50,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(children: [
                    Text(
                      "Verify Phone",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      )),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Code is sent to the mobile number",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        color: grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                    SizedBox(height: 25),
                    Pinput(
                      length: 6,
                      showCursor: true,
                      defaultPinTheme: defaultPinThme,
                      focusedPinTheme: defaultPinThme.copyDecorationWith(
                          border: Border.all(color: darkBlue)),
                      onChanged: (value) {
                        otpCode = value;
                      },
                    ),
                    SizedBox(
                      height: 25,
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
                          onPressed: () async {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithCredential(
                                      PhoneAuthProvider.credential(
                                          verificationId: widget.verificationId,
                                          smsCode: otpCode))
                                  .then((value) async {
                                if (value.user != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Login Successful")));
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()),
                                      (route) => false);
                                }
                              });
                            } catch (e) {
                              FocusScope.of(context).unfocus();

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Invalid OTP")));
                            }
                          },
                          child: Text(
                            "VERIFY AND CONTINUE",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          )),
                    ),
                  ])),
            ),
          )
        ],
      ),
    );
  }

  final defaultPinThme = PinTheme(
      width: 60,
      height: 60,
      textStyle: GoogleFonts.montserrat(
          fontSize: 20, color: blackMain, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: lightBlue,
      ));
}
