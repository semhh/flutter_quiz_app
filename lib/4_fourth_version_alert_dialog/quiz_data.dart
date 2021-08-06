import 'package:quiz_app/4_fourth_version_alert_dialog//question.dart';

class QuizData{

  int _questionIndex = 0;

  List<Question> _allQuestions = [
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

  String getQuestionText (){
    return _allQuestions[_questionIndex].questionText;
  }

  bool getQuestionAnswer (){
    return _allQuestions[_questionIndex].questionAnswer;
  }

  void nextQuestion (){
    if(_questionIndex<_allQuestions.length-1) {
      _questionIndex++;
    }
  }

  bool isTestOver(){
    if(_questionIndex+1>=_allQuestions.length){
      return true;
    }
    else{
      return false;
    }
  }

  void resetQuiz(){
    _questionIndex=0;
  }
}