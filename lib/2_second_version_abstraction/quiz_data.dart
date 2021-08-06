import 'package:quiz_app/2_second_version_abstraction//question.dart';

class QuizData{

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
}