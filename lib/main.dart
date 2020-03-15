import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
QuizBrain quizBrain = QuizBrain();
void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            )
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  void checkAnswer (bool userPickedAnswer){
    setState(() {
      bool correctAnswer = quizBrain.getCorrectAnswer();
      if(quizBrain.isFinished() == true){
        Alert(context: context, title: 'Your quiz have finshied!').show();
        quizBrain.reset();
        scoreKeeper = [];
      }else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
        }quizBrain.nexQuestion();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
            child: Padding(
                padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ),
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(15.0),
              child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text(
                    'True',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: (){
                    checkAnswer(true);
                  },
                  ),
            ),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  checkAnswer(false);
                },

              ),
            ),
        ),
       Row(
          children: scoreKeeper,
       ),
      ],
    );
  }
}
