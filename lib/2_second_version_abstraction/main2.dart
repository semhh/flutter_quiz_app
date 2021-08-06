import 'package:flutter/material.dart';
import 'package:quiz_app/2_second_version_abstraction//constants_2.dart';
import 'package:quiz_app/2_second_version_abstraction//quiz_data.dart';

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

  int questionIndex = 0;

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
                quiz_1.allQuestions[questionIndex].questionText,
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
                            setState(() {
                              quiz_1.allQuestions[questionIndex].questionAnswer ==
                                  false
                                  ? choices.add(cTrueIcon)
                                  : choices.add(cFalseIcon);
                              questionIndex++;
                              //choices.add(cFalseIcon);
                            });
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
                            setState(() {
                              quiz_1.allQuestions[questionIndex].questionAnswer == true
                                  ? choices.add(cTrueIcon)
                                  : choices.add(cFalseIcon);
                              questionIndex++;
                              //choices.add(cFalseIcon);
                            });
                          },
                        ))),
              ])),
        ),
      ],
    );
  }
}

