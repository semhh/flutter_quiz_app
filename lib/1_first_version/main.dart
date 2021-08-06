import 'package:flutter/material.dart';
import 'package:quiz_app/1_first_version/constants.dart';

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

  List<Question> allQuestions = [
    Question(
        questionText: '1.Titanic gelmiş geçmiş en büyük gemidir',
        questionAnswer: false),
    Question(
        questionText: '2.Dünyadaki tavuk sayısı insan sayısından fazladır',
        questionAnswer: true),
    Question(
        questionText: '3.Kelebeklerin ömrü bir gündür', questionAnswer: false),
    Question(questionText: '4.Dünya düzdür', questionAnswer: false),
    Question(
        questionText: '5.Kaju fıstığı aslında bir meyvenin sapıdır',
        questionAnswer: true),
    Question(
        questionText: '6.Fatih Sultan Mehmet hiç patates yememiştir',
        questionAnswer: true),
    Question(
        questionText: '7.Fransızlar 80 demek için, 4 - 20 der',
        questionAnswer: false),
  ];

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
                allQuestions[questionIndex].questionText,
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
                              allQuestions[questionIndex].questionAnswer ==
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
                              allQuestions[questionIndex].questionAnswer == true
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

class Question {
  String questionText;
  bool questionAnswer;

  Question({@required this.questionText, @required this.questionAnswer});
}
