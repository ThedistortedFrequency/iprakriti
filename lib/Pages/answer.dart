import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function select;
  final String answerText;
  const Answer(this.answerText, this.select, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: SizedBox(
        width: double.infinity,
        child:
            ElevatedButton(onPressed: () => select(), child: Text(answerText)),
      ),
    );
  }
}
