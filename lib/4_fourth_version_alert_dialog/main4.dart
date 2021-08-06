import 'package:flutter/material.dart';
import 'package:quiz_app/4_fourth_version_alert_dialog//constants.dart';
import 'package:quiz_app/4_fourth_version_alert_dialog//quiz_data.dart';

void main() => runApp(Quiz_App());

class Quiz_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuestionPage(),
          ),
        ),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> choices = [];

  QuizData quiz_1 = QuizData();

  void buttonFunction(bool isItTrue) {

    if(quiz_1.isTestOver()==true){

      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Congratulations! You finished the quiz."),
            //content: new Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Restart"),
                onPressed: () {
                  setState(() { //Rebuild etmes için setState kullandık
                    quiz_1.resetQuiz(); //Indexi sıfırladık
                    choices= []; //Seçimleri sıfırladık
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    else{
      setState(() {
        quiz_1.getQuestionAnswer() == isItTrue
            ? choices.add(cTrueIcon)
            : choices.add(cFalseIcon);
        quiz_1.nextQuestion();
        //choices.add(cFalseIcon);
      });
    }
  }

  //int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz_1.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.end, //sqğdan başlayıp sola doğru öteleyerek iconları basmak için kullanılır.
          runSpacing: 5.0, //dikeyde iconlar arasına boşluk bırakmak için kullandık.
          spacing: 5.0, //yatayda iconlar arasına boşluk bırakmak için kullandık.
          children: choices,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            buttonFunction(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            buttonFunction(true);
                          },
                        ))),
              ])),
        ),
      ],
    );
  }
}

