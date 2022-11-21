import 'package:flutter/material.dart';
import 'package:paie_arbitre/Vues/insert.dart';
import 'package:paie_arbitre/Widgets/background.dart';
import 'Vues/accueil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Background(classActive: Accueil()),
    );
  }
}