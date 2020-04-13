import 'package:flutter/material.dart';
import 'package:questions_screen/components/question_box.dart';
import 'package:questions_screen/models/question.dart';

class QuestionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }

}

class _QuestionScreenState extends State<QuestionScreen> {

  List<Question> _questions = [
      // example questions
      Question(
        QuestionType.singleRandom,
        "Where one can have a good lunch?"
      ),
      Question(
        QuestionType.normal,
        "What do you think our future will be like?"
      ),
      Question(
        QuestionType.normal,
        "Show your enemies."
      ),
      Question(
        QuestionType.normal,
        "Where can I find you?"
      ),
      Question(
        QuestionType.popularOnF3,
        "What is your attitude towards police?"
      ),
    ];
  List<QuestionBox> _questionBoxes = [];

  _QuestionScreenState() {
    for (int i = 0; i < this._questions.length; ++i) {
      bool isEven = (i % 2) == 0;
      QuestionBox qBox = QuestionBox(
        this._questions[i], 
        isEven
      );
      this._questionBoxes.add(qBox);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabs go here"),
      ),
      body: Container(
        child: Column(
          children: _questionBoxes,
        ),
      )
    );
  }
}