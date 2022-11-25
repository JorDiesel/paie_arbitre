import 'package:flutter/material.dart';
import 'package:paie_arbitre/Widgets/FormInputs/dropdown.dart';
import 'package:paie_arbitre/Widgets/Button/buttonBack.dart';
import 'package:paie_arbitre/Widgets/divider.dart';
import 'package:paie_arbitre/Widgets/FormInputs/numericWidget.dart';
import '../Widgets/FormInputs/datePicker.dart';
import '../Widgets/FormInputs/hourPicker.dart';
import '../Widgets/FormInputs/textForm.dart';
import '../Widgets/textTitle.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _Insert();
}

class _Insert extends State<Insert> {

  TextEditingController dateController = new TextEditingController();
  TextEditingController matchController = new TextEditingController();
  TextEditingController categorieController = new TextEditingController();
  TextEditingController villeController = new TextEditingController();
  TextEditingController heureController = new TextEditingController();
  TextEditingController posteController = new TextEditingController();
  List<String> listCategorie = <String>["Novice", "Atome", "Peewee", "Bantam", "Midget", "Junior"];
  List<String> listVille = <String>["Warwick", "Kingsey Falls", "Val-des-Sources"];
  List<String> listPoste = <String>["À deux", "Juge de ligne", "Arbitre chef"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 50.0)),
            const CustomDivider(),
            const TextWidget(text: "Ajouter des matchs"),
            const CustomDivider(),
            Spacer(),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(10.0)),
                TextForm(text: "Date : "),
                DatePicker(controller: dateController),
                Padding(padding: EdgeInsets.all(10.0)),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(10.0)),
                TextForm(text: "Numéro de match : "),
                NumericWidget(controller: matchController,),
                Padding(padding: EdgeInsets.all(10.0)),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(10.0)),
                TextForm(text: "Catégorie : "),
                DropdownButtonWidget(listType: listCategorie, controleur: categorieController,),
                Padding(padding: EdgeInsets.all(10.0)),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(10.0)),
                TextForm(text: "Ville : "),
                DropdownButtonWidget(listType: listVille, controleur: villeController,),
                Padding(padding: EdgeInsets.all(10.0)),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(10.0)),
                TextForm(text: "Heure : "),
                HourPicker(controller: heureController,),
                Padding(padding: EdgeInsets.all(10.0)),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(10.0)),
                TextForm(text: "Poste : "),
                DropdownButtonWidget(listType: listPoste, controleur: posteController,),
                Padding(padding: EdgeInsets.all(10.0)),
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
                clearData();
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
        )
      );
  }

  void clearData(){
    dateController.clear();
    matchController.clear();
    heureController.clear();
  }
}