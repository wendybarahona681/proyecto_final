import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  List<Map<String, Object>> _questions = [
    {
      'questionText': '¿Cuál es el color del cielo?',
      'answers': [
        {'text': 'Rojo', 'score': 0},
        {'text': 'Azul', 'score': 10},
        {'text': 'Verde', 'score': 0},
      ],
    },
    {
      'questionText': '¿Cuántos dedos tiene una mano?',
      'answers': [
        {'text': 'Cinco', 'score': 10},
        {'text': 'Seis', 'score': 0},
        {'text': 'Cuatro', 'score': 0},
      ],
    },
    // Agrega más preguntas según sea necesario
  ];

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz para Niños'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/kids_background.jpg'), // Ajusta la ruta de la imagen según tu proyecto
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  questionIndex: _questionIndex,
                  questions: _questions,
                  answerQuestion: _answerQuestion,
                )
              : Result(_resetQuiz),
        ),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final Function answerQuestion;

  Quiz({
    required this.questionIndex,
    required this.questions,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'] as String),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList(),
      ],
    );
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 24, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}

class Result extends StatelessWidget {
  final VoidCallback resetHandler;

  Result(this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '¡Has completado el quiz!',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: resetHandler,
          child: Text('Volver al inicio'),
        ),
      ],
    );
  }
}
