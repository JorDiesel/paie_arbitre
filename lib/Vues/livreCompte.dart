import 'package:flutter/material.dart';
import 'package:paie_arbitre/Widgets/FormInputs/textForm.dart';

import '../Models/dropdownModel.dart';
import '../SqLite/sqlite.dart';
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

  int? montantDut = 0;
  double? montantRecu = 0;
  TextEditingController moisController = new TextEditingController(text: "0");
  String? dropdownValue;

  @override
  Widget build(BuildContext context){

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
              FutureBuilder<List<DropdownModel>>(
                  future: Sqlite.getMois(),
                  builder: (BuildContext context, AsyncSnapshot<List<DropdownModel>> snapshot){
                    if (snapshot.hasData) {
                      return DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        hint: Text("Sélectionner une valeur"),
                        underline: Container(
                          height: 2,
                          color: Colors.yellowAccent,
                        ),
                        onChanged: (String? value) {
                          dropdownValue = value!;
                          moisController.text = dropdownValue!;
                          setState(() {
                            dropdownValue;
                          });
                        },
                        items: snapshot.data?.map<DropdownMenuItem<String>>((DropdownModel value) {
                          return DropdownMenuItem<String>(
                            value: value.id.toString(),
                            child: Text(value.nom),
                          );
                        }).toList(),
                      );
                    }
                    else{
                      return Text("fuck");
                    }
                  }
              ),
              Spacer()
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              FutureBuilder<int>(
                future: Sqlite.getMontanDut(moisController.text),
                builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                  if (snapshot.hasData) {
                    montantDut = snapshot.data;
                    return TextForm(text: "Montant produit: " + snapshot.data.toString() + "\$");
                  }
                  else{
                    return TextForm(text: "Montant produit: " + "\$\$\$\$");
                  }
                }
              ),
              Spacer(),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              FutureBuilder<double>(
                  future: Sqlite.getMontanRecu(int.parse(moisController.text)),
                  builder: (BuildContext context, AsyncSnapshot<double> snapshot){
                    if (snapshot.hasData) {
                      montantRecu = snapshot.data;
                      return TextForm(text: "Montant reçu: " + snapshot.data.toString() + "\$");
                    }
                    else{
                      return TextForm(text: "Montant reçu: " + "\$\$\$\$");
                    }
                  }
              ),
              Spacer(),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              TextForm(text: "Différence: " + (montantRecu! - montantDut!).toString() + "\$"),
              Spacer(),
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
            onPressed: () {setState(() {

            });},
            child: Text("Calculer la différence", style: const TextStyle(color: Colors.black, fontSize: 20.0)),
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