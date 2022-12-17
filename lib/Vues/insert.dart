import 'package:flutter/material.dart';
import 'package:paie_arbitre/Widgets/FormInputs/dropdown.dart';
import 'package:paie_arbitre/Widgets/Button/buttonBack.dart';
import 'package:paie_arbitre/Widgets/divider.dart';
import 'package:paie_arbitre/Widgets/FormInputs/numericWidget.dart';
import '../Models/dropdownModel.dart';
import '../SqLite/sqlite.dart';
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
  TextEditingController tarifController = new TextEditingController();

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
                FutureBuilder<List<DropdownModel>>(
                    future: Sqlite.getCategories(),
                    builder: (BuildContext context, AsyncSnapshot<List<DropdownModel>> snapshot){
                      if (snapshot.hasData) {
                        return DropdownButtonWidget(listType: snapshot.data! , controleur: categorieController);
                      }
                      else{
                        return Text("fuck");
                      }
                    }
                ),
                Padding(padding: EdgeInsets.all(10.0)),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(10.0)),
                TextForm(text: "Ville : "),
                FutureBuilder<List<DropdownModel>>(
                    future: Sqlite.getVilles(),
                    builder: (BuildContext context, AsyncSnapshot<List<DropdownModel>> snapshot){
                      if (snapshot.hasData) {
                        return DropdownButtonWidget(listType: snapshot.data! , controleur: villeController);
                      }
                      else{
                        return Text("fuck");
                      }
                    }
                ),
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
                FutureBuilder<List<DropdownModel>>(
                    future: Sqlite.getPostes(),
                    builder: (BuildContext context, AsyncSnapshot<List<DropdownModel>> snapshot){
                      if (snapshot.hasData) {
                        return DropdownButtonWidget(listType: snapshot.data! , controleur: posteController);
                      }
                      else{
                        return Text("fuck");
                      }
                    }
                ),
                Padding(padding: EdgeInsets.all(10.0)),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(10.0)),
                TextForm(text: "Tarif : "),
                NumericWidget(controller: tarifController,),
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
                Sqlite.createMatch(dateController.text, int.parse(villeController.text), int.parse(matchController.text) , int.parse(categorieController.text), heureController.text, int.parse(posteController.text), int.parse(tarifController.text));
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
    matchController.clear();
    heureController.clear();
    tarifController.clear();
  }
}