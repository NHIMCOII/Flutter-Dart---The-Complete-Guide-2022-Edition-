import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final VoidCallback textHandler;

  TextControl(this.textHandler);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: textHandler,
      child: Text('Next'),
    );
  }
}
