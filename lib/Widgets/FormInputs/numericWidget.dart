import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumericWidget extends StatelessWidget {
  final TextEditingController controller;

  const NumericWidget({required this.controller, super.key});

  @override
  Widget build(BuildContext context){
    return Expanded(
        child: TextField(
          keyboardType: TextInputType.number,
          controller: controller,
          cursorColor: Colors.black,
          cursorHeight: 30,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.yellowAccent),
            ),
          ),
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
        ),
      );
  }
}