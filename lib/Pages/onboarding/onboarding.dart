import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iprakriti/Pages/onboarding/page1.dart';
import 'package:iprakriti/Pages/onboarding/page2.dart';
import 'package:iprakriti/Pages/onboarding/page3.dart';
import 'package:iprakriti/util/route.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// outline button style
final kbuttonStyle = ButtonStyle(
  // outline button border color
  side: MaterialStateProperty.all<BorderSide>(
      const BorderSide(color: Colors.white)),
  shape: MaterialStateProperty.all(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  )),
);

// text style
final kTextStyle = GoogleFonts.poppins(
    color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold);

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // page controller.
  final PageController _controller = PageController();

  // last page or not
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          // last page
          onPageChanged: (pageIndex) {
            setState(() {
              lastPage = (pageIndex == 2);
            });
          },
          controller: _controller,
          children: const [PageOne(), PageSecond(), PageThird()],
        ),

        // skip, next and dot indicator.
        Container(
            alignment: const Alignment(0, 0.8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // skip button
                  OutlinedButton(
                    style: kbuttonStyle,
                    onPressed: () => _controller.jumpToPage(2),
                    child: Text("Skip", style: kTextStyle),
                  ),

                  // three dot.
                  SmoothPageIndicator(
                    axisDirection: Axis.horizontal,
                    effect: SlideEffect(
                      spacing: 8.0,
                      radius: 5.0,
                      dotWidth: 8.0,
                      dotHeight: 8.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey.shade100,
                      activeDotColor: Colors.grey.shade100,
                    ),
                    controller: _controller,
                    count: 3,
                  ),

                  // next and done button.
                  lastPage
                      ?
                      // next button
                      OutlinedButton(
                          style: kbuttonStyle,
                          onPressed: () {
                            const CircularProgressIndicator();
                            Navigator.popAndPushNamed(context, Pages.loginpage);
                          },
                          child: Text("Done", style: kTextStyle),
                        )
                      :
                      // done button
                      OutlinedButton(
                          style: kbuttonStyle,
                          onPressed: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text(
                            "Next",
                            style: kTextStyle,
                          ),
                        )
                ]))
      ]),
    );
  }
}
