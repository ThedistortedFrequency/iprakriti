import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final imainfstyle = GoogleFonts.poppins(
  textStyle: const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30),
);

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff8b65b4),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                  "assets/image/vata.png",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text("VATA", style: imainfstyle),
              const SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 14)),
                    text:
                        "In Ayurveda, Vata embodies the qualities of movement and change. Understanding your Vata constitution is vital."),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
