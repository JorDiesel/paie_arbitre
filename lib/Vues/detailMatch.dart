import 'package:flutter/material.dart';
import 'package:paie_arbitre/SqLite/sqlite.dart';
import 'package:paie_arbitre/Vues/update.dart';
import 'package:paie_arbitre/Widgets/Button/buttonBack.dart';
import 'package:paie_arbitre/Widgets/Button/buttonNavigation.dart';
import 'package:paie_arbitre/Widgets/FormInputs/textForm.dart';
import 'package:paie_arbitre/Widgets/divider.dart';
import '../Models/match.dart';
import '../Widgets/textTitle.dart';

class DetailMatch extends StatelessWidget{
  final MatchModel? model;
  const DetailMatch({required this.model, super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 50.0)),
          const CustomDivider(),
          TextWidget(text: "Match # " + model!.numeromatch.toString()),
          const CustomDivider(),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Ville : "),
              Spacer(),
              TextForm(text: model!.ville),
              Spacer()
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Heure : "),
              Spacer(),
              TextForm(text: model!.heure),
              Spacer()
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Catégorie : "),
              Spacer(),
              TextForm(text: model!.categorie),
              Spacer()
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Poste : "),
              Spacer(),
              TextForm(text: model!.poste),
              Spacer()
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Tarif : "),
              Spacer(),
              TextForm(text: model!.tarif.toString() + "\$"),
              Spacer()
            ],
          ),
          Spacer(),
          CustomDivider(),
          Padding(padding: EdgeInsets.all(5.0)),
          //Button update
          ButtonNavigation(text: "Modifier", color: Colors.green, direction: Update(model: model)),
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
            onPressed: (){
              Sqlite.deleteMatch(model!.id);
              Navigator.pop(context);
            },
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

