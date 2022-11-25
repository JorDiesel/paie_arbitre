import 'package:flutter/material.dart';
import 'package:paie_arbitre/Vues/update.dart';
import 'package:paie_arbitre/Widgets/Button/buttonBack.dart';
import 'package:paie_arbitre/Widgets/Button/buttonNavigation.dart';
import 'package:paie_arbitre/Widgets/FormInputs/textForm.dart';
import 'package:paie_arbitre/Widgets/divider.dart';
import '../Models/match.dart';
import '../Widgets/textTitle.dart';

class DetailMatch extends StatelessWidget{
  //final MatchModel? model;
  const DetailMatch({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 50.0)),
          const CustomDivider(),
          const TextWidget(text: "Match # 1234"),
          const CustomDivider(),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Ville : "),
              Spacer(),
              TextForm(text: "Ville"),
              Spacer()
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Heure : "),
              Spacer(),
              TextForm(text: "Heure"),
              Spacer()
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Catégorie : "),
              Spacer(),
              TextForm(text: "Catégorie"),
              Spacer()
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Poste : "),
              Spacer(),
              TextForm(text: "Poste"),
              Spacer()
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Tarif : "),
              Spacer(),
              TextForm(text: "Tarif"),
              Spacer()
            ],
          ),
          Spacer(),
          CustomDivider(),
          Padding(padding: EdgeInsets.all(5.0)),
          //Button update
          ButtonNavigation(text: "Modifier", color: Colors.green, direction: Update()),
          Padding(padding: EdgeInsets.all(5.0)),
          //Button delete
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: Size(MediaQuery.of(context).size.height * (1/3) , 75),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: const BorderSide(color: Colors.black, width: 2)
              ),
            ),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Confirmer la suppression'),
                content: const Text('Êtes-vous certain de vouloir supprimer le match numéro 1234?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Annuler'),
                    child: const Text('Annuler'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Oui'),
                    child: const Text('Oui'),
                  ),
                ],
              ),
            ),
            child: Text("Supprimer", style: const TextStyle(color: Colors.black, fontSize: 20.0)),
          ),
          Padding(padding: EdgeInsets.all(5.0)),
          ButtonBack(pageContext: context),
          //Spacer(),
          CustomDivider(),
          Padding(padding: EdgeInsets.all(5.0)),
        ],
      )
    );
  }
}

