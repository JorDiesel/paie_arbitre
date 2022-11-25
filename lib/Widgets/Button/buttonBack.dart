import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget{
  final BuildContext pageContext;

  const ButtonBack({required this.pageContext ,super.key});

  @override
  Widget build(BuildContext context){
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.yellowAccent,
        minimumSize: Size(MediaQuery.of(context).size.height * (1/3) , 75),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: const BorderSide(color: Colors.black, width: 2)
        ),
      ),
      onPressed: () {Navigator.pop(pageContext);},
      child: Text("Retour", style: const TextStyle(color: Colors.black, fontSize: 20.0)),
    );
  }
}