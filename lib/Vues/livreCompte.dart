import 'package:flutter/material.dart';
import 'package:paie_arbitre/Widgets/FormInputs/textForm.dart';

import '../Widgets/Button/buttonBack.dart';
import '../Widgets/FormInputs/dropdown.dart';
import '../Widgets/divider.dart';
import '../Widgets/textTitle.dart';

class LivreCompte extends StatefulWidget{
  const LivreCompte({super.key});

  @override
  State<LivreCompte> createState() => _LivreCompte();
}


class _LivreCompte extends State<LivreCompte>{

  @override
  Widget build(BuildContext context){

    TextEditingController moisController = new TextEditingController();
    List<String> listMois = <String>["Octobre", "Novembre", "Décembre", "Janvier", "Février", "Mars", "Avril"];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 50.0)),
          const CustomDivider(),
          const TextWidget(text: "Livre de compte"),
          const CustomDivider(),
          Row(
            children: [
              Spacer(),
              DropdownButtonWidget(listType: listMois, controleur: moisController),
              Spacer()
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Montant produit: " + "\$\$\$\$"),
              Spacer(),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Montant reçu: " + "\$\$\$\$"),
              Spacer(),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Différence: " + "\$\$\$\$"),
              Spacer(),
            ],
          ),
          Spacer(),
          CustomDivider(),
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