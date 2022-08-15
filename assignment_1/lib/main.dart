import 'package:flutter/material.dart';

import './text.dart';
import './textControl.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _text = const [
    'Text 1',
    'Text 2',
    'Text 3',
  ];

  var _textIndex = 0;

  void _nextText() {
    setState(() {
      _textIndex++;
    });
    if (_textIndex == 3) {
      _textIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assignment 1'),
        ),
        body: Column(
          children: [
            MyText(_text[_textIndex]),
            TextControl(_nextText),
          ],
        ),
      ),
    );
  }
}
