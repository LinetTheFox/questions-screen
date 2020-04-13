enum QuestionType {
  normal,
  singleRandom,
  popularOnF3,
}

class Question {
  QuestionType _questionType;
  String _questionText;

  Question(this._questionType, this._questionText);

  QuestionType get questionType => this._questionType;
  String get questionText => this._questionText;
}