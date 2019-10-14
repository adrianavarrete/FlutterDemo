import 'package:flutter/material.dart';
import 'package:my_first_app/result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  var _questions = [
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

  void _answerQuestion() {
    if (_questionIndex < _questions.length - 1) {
      print('tenemos mas preguntas');
    }

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // Map

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(),
      ),
    );
  }
}
