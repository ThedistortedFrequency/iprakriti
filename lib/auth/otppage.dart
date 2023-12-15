// ignore_for_file: avoid_print, unused_local_variable, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iprakriti/auth/loginpage.dart';
import 'package:iprakriti/util/route.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amberAccent),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.amber),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.grey.shade100,
      ),
    );
    var code = "";
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Lottie.asset(
                  "assets/animation1.json",
                  repeat: true,
                ),

                // Welcome Text.
                Text(
                  "OTP Verification",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Enter the OTP you just received.",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                // phone no.
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter OTP",
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                Pinput(
                  length: 6,
                  onChanged: ((value) {
                    code = value;
                  }),
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),

                const SizedBox(
                  height: 40,
                ),

                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    autofocus: true,
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                                child: CircularProgressIndicator());
                          });
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: LoginPage.verify,
                                smsCode: code);

                        await auth.signInWithCredential(credential);
                        Navigator.pushNamedAndRemoveUntil(
                            context, Pages.homepage, (route) => false);
                      } catch (e) {
                        print("wrong otp");

                        // for closing circular process indicator.
                        Navigator.of(context).pop();

                        // showing error code.

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Error"),
                                content: const Text(
                                    "Invalid OTP. Please try again."),
                                actions: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    child: const Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    },
                    child: Text(
                      "Submit OTP",
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
