import 'package:flutter/material.dart';
import 'package:paie_arbitre/Vues/consultMatch.dart';
import 'package:paie_arbitre/Vues/detailMatch.dart';
import 'package:paie_arbitre/Vues/livreCompte.dart';
import 'package:paie_arbitre/Vues/paie.dart';
import 'package:paie_arbitre/Widgets/divider.dart';
import 'package:paie_arbitre/Widgets/textTitle.dart';

import '../Widgets/Button/buttonNavigation.dart';
import 'insert.dart';

class Accueil extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Column(
            children: [
              Spacer(),
              Image.asset('images/logo.png', height: 200, width: 200),
              Spacer(),
              CustomDivider(),
              const TextWidget(text: 'Gestionnaire de payes'),
              const CustomDivider(),
              const Spacer(),
              ButtonNavigation(text: "Ajouter des matchs", color: Colors.yellowAccent, direction: Insert()),
              const Spacer(),
              ButtonNavigation(text: "Consulter les matchs", color: Colors.yellowAccent, direction: Consult()),
              const Spacer(),
              ButtonNavigation(text: "Ajouter un montant", color: Colors.yellowAccent, direction: Paie()),
              const Spacer(),
              ButtonNavigation(text: "Livre de compte", color: Colors.yellowAccent, direction: LivreCompte()),
              const CustomDivider(),
              const Spacer()
            ],
          ),
     );
  }
}