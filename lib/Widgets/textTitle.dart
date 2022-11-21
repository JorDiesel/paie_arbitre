
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget{
  final String text;

  const TextWidget({required this.text});

  @override
  Widget build(BuildContext context){
    return Text(
      text,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontWeight: FontWeight.bold,
          fontSize: 28.0,
          color: Colors.black
      ),
    );
  }
}