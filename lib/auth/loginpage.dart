import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iprakriti/util/route.dart';
import 'package:lottie/lottie.dart';

final _formkey = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String verify = "";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phonecontroller = TextEditingController();
  TextEditingController countrycode = TextEditingController();

  var phone = "";

  @override
  void initState() {
    countrycode.text = "+91";
    super.initState();
  }

  @override
  void dispose() {
    phonecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Lottie.asset(
                    "assets/animation1.json",
                    repeat: true,
                  ),

                  // Welcome Text.
                  Text(
                    "Welcome back!",
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "We need to register your phone number.",
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
                      "Phone Number",
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.14,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.amber.shade100),
                          height: MediaQuery.of(context).size.height * 0.068,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                                child: TextField(
                              controller: countrycode,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                  )),
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),

                      // Number container and textfield
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.068,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.amber.shade100),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: TextFormField(
                                controller: phonecontroller,
                                onChanged: (value) {
                                  phone = value;
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: " Enter your number",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Required";
                                  } else if (value.length < 10) {
                                    return "Invalid number";
                                  } else if (value.length > 10) {
                                    return "Invalid number";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  Text(
                    "A 6 digit OTP sent via SMS to verify your mobile number!",
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
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
                        if (_formkey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              });
                        }
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: countrycode.text + phone,
                          verificationCompleted:
                              (PhoneAuthCredential credential) async {
                            await FirebaseAuth.instance
                                .signInWithCredential(credential);
                          },
                          verificationFailed: (FirebaseAuthException e) {
                            /*  showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content:
                                        const Text("Enter your valid number"),
                                    actions: <Widget>[
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
                                }); */
                          },
                          codeSent: (String verificationId, int? resendToken) {
                            LoginPage.verify = verificationId;

                            Navigator.pushNamed(context, Pages.otppage);
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      },
                      child: Text(
                        "Get OTP",
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
      ),
    );
  }
}
