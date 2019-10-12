import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // Map
    var questions = [
      {
        'questionText': '¿Cuál es tu comida favorita?',
        'answers': ['Macarrones', 'Pollo al curry', 'Lasaña'],
      },
      {
        'questionText': '¿Cuál es tu animal favorito?',
        'answers': ['Perro', 'Gato', 'Loro'],
      },
      {
        'questionText': '¿Quién es el mejor programador?',
        'answers': ['Adri', 'Adri', 'Adri'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First app'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion,answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
