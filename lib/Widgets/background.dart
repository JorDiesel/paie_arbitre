

import 'package:flutter/material.dart';

class Background extends StatelessWidget{
  final classActive;

  const Background({super.key, required this.classActive});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(230, 230, 230, 1),
            image: DecorationImage(
              image: AssetImage("images/logo.png"),
              repeat: ImageRepeat.repeat,
              opacity: 0.1
            )
          ),
          height: (MediaQuery.of(context).size.height),
          width: (MediaQuery.of(context).size.width),
          child: classActive,
        ),
      ),
    );
  }
}