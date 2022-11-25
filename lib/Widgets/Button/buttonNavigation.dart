
import 'package:flutter/material.dart';

class ButtonNavigation extends StatelessWidget{
  final String text;
  final Color color;
  final direction;

  const ButtonNavigation({ super.key,
    required this.text,
    required this.color,
    required this.direction
  });

  @override
  Widget build(BuildContext context){
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(MediaQuery.of(context).size.height * (1/3) , 75),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: const BorderSide(color: Colors.black, width: 2)
        ),
      ),
      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => direction));},
      child: Text(text, style: const TextStyle(color: Colors.black, fontSize: 20.0)),
    );
  }
}