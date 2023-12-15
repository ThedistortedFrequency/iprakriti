import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

final gfonts = GoogleFonts.poppins();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imagefile;

  // signout method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  // method for getImage
  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);

    if (file?.path != null) {
      imagefile = File(file!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[100],
        title: Text(
          "IPRAKRITI",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          )),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/face.png",
              ),
              Text(
                "Face Scanner",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 14, color: Colors.black)),
                    text:
                        "Face Scanner scan your face, Which detects Person through facial recognition and show stored information."),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: 50,
              ),

              // button for camera and select files.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: FilledButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.blue,
                              ),
                              shape: MaterialStatePropertyAll(
                                  LinearBorder.bottom())),
                          onPressed: () {
                            getImage(source: ImageSource.camera);
                          },
                          child: Center(
                            child: Center(
                              child: Text(
                                "Captuer Image",
                                style: gfonts,
                              ),
                            ),
                          ))),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
