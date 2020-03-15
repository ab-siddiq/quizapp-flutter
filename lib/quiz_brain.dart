import 'question.dart';
class QuizBrain{
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question(q: 'Bangladesh is a development Country', a: true),
    Question(q: 'Bangladesh is not an independent country', a: false),
    Question(q: 'Bangladesh has 64 disticts', a: true),
    Question(q: 'Bangladesh is a non muslim country', a: false),
    Question(q: 'Bangladesh is cold country', a: false),
    Question(q: 'Bangli people are cheater', a: true),
    Question(q: 'Rice is our national food', a: false),
    Question(q: 'Banana is our national fruit', a: false),
    Question(q: 'Dog is our national animal', a: false),
    Question(q: 'Bangladesh is a develping country', a: true),
    Question(q: 'Sakib is a an allrounder', a: true),
    Question(q: 'Tamim is an opening batsman', a: true),
    Question(q: 'Musfiq is a wicketkeeper batsman', a: true),
    Question(q: 'Miraz is a spiner', a: true),
    Question(q: 'Papon is BCB president', a: true),
    Question(q: 'Tamim is the present captain of BD Cricket team', a: true),
  ];

  void nexQuestion(){
    if(_questionNumber<_questionBank.length -1){
      _questionNumber++;
    }
  }
  String getQuestionText (){
    return _questionBank[_questionNumber].questionText;
  }
  bool getCorrectAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }
  bool isFinished(){
    if(_questionNumber>=_questionBank.length -1){
      return true;
    }else{
      return false;
    }
  }
  void reset(){
    _questionNumber = 0;
  }
}