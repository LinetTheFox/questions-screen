import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:questions_screen/components/question_box.dart';
import 'package:questions_screen/models/question.dart';
import 'package:questions_screen/screens/placeholder_screen.dart';

class QuestionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }

}

class _QuestionScreenState extends State<QuestionScreen> {

  // Color _inboxIconColor = Colors.black;
  // Color _bellIconColor = Colors.grey;

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

  // void _switchIconColors(int index) {
  //   setState(() {
  //     if (_inboxIconColor == Colors.black) {
  //       this._inboxIconColor = Colors.grey;
  //       this._bellIconColor = Colors.black;
  //     } else {
  //       this._inboxIconColor = Colors.black;
  //       this._bellIconColor = Colors.grey;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Scaffold(

            appBar: TabBar(
              indicatorColor: Colors.grey[700],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,

              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.inbox, 
                    size: 32,
                  ),
                ),
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.bell,
                    size: 32
                  ),
                ),
              ],
            ),

            body: TabBarView(
              children: <Widget>[
                Container(
                  child: Center(
                    child: Column(
                      children: _questionBoxes,
                    ) 
                  ),
                ),

                PlaceholderScreen(),
              ],
            )
          )
        ),
        Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  color: Colors.yellow,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "GET MORE QUESTIONS", 
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(
                      color: Colors.yellow,
                    )
                  )
                )
              ],
            )
          )
        )
      ],
      
    );
  }
}