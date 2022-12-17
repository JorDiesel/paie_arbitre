import 'package:flutter/material.dart';
import 'package:paie_arbitre/SqLite/sqlite.dart';
import 'package:paie_arbitre/Widgets/FormInputs/datePicker.dart';
import 'package:paie_arbitre/Widgets/FormInputs/numericWidget.dart';
import 'package:paie_arbitre/Widgets/FormInputs/textForm.dart';

import '../Widgets/Button/buttonBack.dart';
import '../Widgets/divider.dart';
import '../Widgets/textTitle.dart';

class Paie extends StatefulWidget {
  const Paie({super.key});

  @override
  State<Paie> createState() => _Paie();
}

class _Paie extends State<Paie> {

  TextEditingController montantController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 50.0)),
          const CustomDivider(),
          const TextWidget(text: "Ajouter des montants"),
          const CustomDivider(),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Montant"),
              Spacer()
            ],
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.all(40.0)),
              NumericWidget(controller: montantController),
              Padding(padding: EdgeInsets.all(40.0))
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Date du dépôt"),
              Spacer()
            ],
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.all(40.0)),
              DatePicker(controller: dateController),
              Padding(padding: EdgeInsets.all(40.0)),
            ],
          ),
          Spacer(),
          CustomDivider(),
          Padding(padding: EdgeInsets.all(5.0)),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.yellowAccent,
              minimumSize: Size(MediaQuery.of(context).size.height * (1/3) , 75),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: const BorderSide(color: Colors.black, width: 2)
              ),
            ),
            onPressed: () {
              Sqlite.createPaie(double.parse(montantController.text), dateController.text);
              Navigator.pop(context);
              },
            child: const Text("Soumettre", style: TextStyle(color: Colors.black, fontSize: 20.0)),
          ),
          Padding(padding: EdgeInsets.all(5.0)),
          ButtonBack(pageContext: context),
          Padding(padding: EdgeInsets.all(5.0)),
          //Spacer(),
          CustomDivider(),
          Padding(padding: EdgeInsets.all(5.0)),
        ],
      ),
    );
  }
}