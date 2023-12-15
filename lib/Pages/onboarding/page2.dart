import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iprakriti/Pages/onboarding/page1.dart';

class PageSecond extends StatelessWidget {
  const PageSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff41a9cc),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Image.asset(
                  "assets/image/pitta.png",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "PITTA",
                style: imainfstyle,
              ),
              const SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 14)),
                    text:
                        "In Ayurveda, Pitta signifies fire and transformation. Discovering your Pitta composition is crucial for your well-being."),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
