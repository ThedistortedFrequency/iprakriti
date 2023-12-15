import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iprakriti/Pages/onboarding/page1.dart';

class PageThird extends StatelessWidget {
  const PageThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffe37166),
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
                  "assets/image/kapha.png",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "KAPHA",
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
                        "In Ayurveda, Kapha embodies stability and strength. Unveiling your Kapha balance is key to a harmonious life."),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
