import 'package:flutter/material.dart';
import 'package:iprakriti/Pages/answer.dart';
import 'package:iprakriti/Pages/questionwid.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
      print(_questionIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    var question = [
      {
        'questionText': "Body Frame?",
        'answer': [
          "Narrow",
          "Medium",
          "Wide",
        ],
      },
      {
        'questionText': "Is your scalp hair prone to (Nature)?",
        'answer': [
          'Graying',
          'Falling',
          'Breaking',
          'Split',
          'ends',
          'Both',
          'None',
        ],
      },
      {
        'questionText': "Hair Nature?",
        'answer': [
          'Dry',
          'Oily',
          'Normal',
          'Seasonal',
        ],
      },
      {
        'questionText': "How is your appetite (Regularity)?",
        'answer': [
          'Regular',
          'Irregular',
        ],
      },
      {
        'questionText': "How is your appetite (Frequency)?",
        'answer': [
          'Frequent',
          'Infrequent',
        ],
      },
      {
        'questionText':
            "Are you able to digest the amount of food consumed by you?",
        'answer': [
          'Always yes',
          'If excess is taken',
          'cause indigestion',
        ],
      },
      {
        'questionText': "Stool consistency?",
        'answer': [
          'Regular',
          'Irregular',
          ' Occasionally irregular',
        ],
      },
      {
        'questionText': "Quality of Sleep?",
        'answer': [
          ' Deep',
          ' Moderate/sound',
          ' Shallow',
        ],
      },
      {
        'questionText': "Do you tend to have?",
        'answer': [
          'Constipation',
          'Losse motion',
          'None',
        ],
      },
      {
        'questionText': "Does your body temperature in general remains?",
        'answer': [
          'Higher compared to others',
          'Lower compared to others',
          'Average',
          'Variable',
        ],
      },
      {
        'questionText': "Do you get sleep immediately after going to bed?",
        'answer': [
          ' Yes ',
          'After few minutes',
          'No it takes long time to fall asleep',
        ],
      },
    ];
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QueList(
                question[_questionIndex]['questionText'].toString(),
              ),
              ...(question[_questionIndex]['answer'] as List<String>)
                  .map((answer) {
                return Answer(answer, _answerQuestion);
              }).toList()
            ],
          ),
        ),
      ),
    );
  }
}
