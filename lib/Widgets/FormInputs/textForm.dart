
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget{
  final String text;

  const TextForm({required this.text});

  @override
  Widget build(BuildContext context){
    return Text(
      text,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: Colors.black
      ),
    );
  }
}