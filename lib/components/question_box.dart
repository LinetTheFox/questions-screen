import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:questions_screen/models/question.dart';

class QuestionBox extends StatefulWidget {

  final Question _question;
  final bool _evenOrderNumber;

  const QuestionBox(this._question, this._evenOrderNumber);

  @override
  State<StatefulWidget> createState() {
    return _QuestionBoxState(this._question, this._evenOrderNumber);
  }
  
}

class _QuestionBoxState extends State<QuestionBox> {

  Widget _icon;
  String _questionText;

  // helper fields to avoid repeating same code for building the widget
  Color _iconBgColor;
  bool _isRandomQuestion;

  _QuestionBoxState(Question question, bool evenOrderNumber) {
    // setting color for icon background so it alterates in question list
    if (evenOrderNumber) {
      this._iconBgColor = Colors.cyan[300];
    } else {
      this._iconBgColor = Colors.blue[600];
    }

    // picking icon for each type of question
    switch (question.questionType) {
      case QuestionType.normal:
        this._icon = _QuestionBoxIcons.normalIcon(this._iconBgColor);
        break;
      case QuestionType.singleRandom:
        this._icon = _QuestionBoxIcons.randomIcon(this._iconBgColor);
        break;
      case QuestionType.popularOnF3:
        this._icon = _QuestionBoxIcons.popularIcon();
        break;
    }

    // if question type is random - set the respective flag (will be
    // used for subtitle in the card later)
    this._isRandomQuestion =
      (question.questionType == QuestionType.singleRandom);

    this._questionText = question.questionText;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: this._icon,
                  title: Text(
                    this._questionText,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  // if is random question - set respective subtitle
                  subtitle: this._isRandomQuestion ? 
                    Text(
                      "RANDOM QUESTION",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ) : null,
                )
              ],
            ),
          )
        ),
      ),
    );
  }

}


/// Class containing custom "icons" for QuestionBox */
class _QuestionBoxIcons {

  static normalIcon(Color color) => CircleAvatar(
    backgroundColor: color,
    radius: 30,
    child: Icon(
      FontAwesomeIcons.ghost,
      color: Colors.white,
      size: 44
    )
  );

  static randomIcon(Color color) => CircleAvatar(
    backgroundColor: color,
    radius: 30,
    child: Icon(
      Icons.sync,
      color: Colors.white,
      size: 48
    )
  );

  static popularIcon() => CircleAvatar(
    backgroundColor: Colors.green,
    radius: 30,
    child: Stack(
      children: <Widget>[
        Text(
          "F3",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = Colors.white
          ),
        ),
        Text(
          "F3",
          style: TextStyle(
            fontSize: 36,
            color: Colors.black
          ),
        )
      ],
    )
  );
}