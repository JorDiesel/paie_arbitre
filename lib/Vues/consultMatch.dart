import 'package:flutter/material.dart';
import 'package:paie_arbitre/Models/match.dart';
import 'package:paie_arbitre/SqLite/sqlite.dart';
import 'package:paie_arbitre/Vues/detailMatch.dart';
import 'package:paie_arbitre/Widgets/Button/buttonBack.dart';
import 'package:paie_arbitre/Widgets/FormInputs/textForm.dart';
import 'package:paie_arbitre/Widgets/divider.dart';

import '../Models/dropdownModel.dart';
import '../Widgets/FormInputs/dropdown.dart';
import '../Widgets/textTitle.dart';

class Consult extends StatefulWidget {
  const Consult({super.key});

  @override
  State<Consult> createState() => _Consult();
}

class _Consult extends State<Consult>{
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
          const TextWidget(text: "Consultation"),
          const CustomDivider(),
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
          Container(
            width: 600,
            height: 400,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints){
                  return SizedBox(
                    width: constraints.maxWidth / 2,
                    child: Scrollbar(
                      thumbVisibility: true,
                            child: FutureBuilder<List<MatchModel>>(
                              future: Sqlite.getMatch(int.parse(moisController.text)),
                              builder: (BuildContext context, AsyncSnapshot<List<MatchModel>> snapshot){
                                if(snapshot.hasData){
                                  return ListView.builder(
                                    primary: true,
                                    itemCount: snapshot.data?.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        height: 75,
                                        color: index.isEven
                                            ? Color.fromRGBO(120, 120, 120, 100)
                                            : Color.fromRGBO(80, 80, 80, 100),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMatch(model: snapshot.data![index])));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                                children: [
                                                  Spacer(),
                                                  TextForm(text: "Match numéro " + (snapshot.data![index].numeromatch).toString()),
                                                  Spacer()
                                                ]
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                                else{
                                  return ListView.builder(
                                    primary: true,
                                    itemCount: 0,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(

                                      );
                                    },
                                  );
                                }
                              }
                            )
                      ),
                    );
                }
            ),
          ),
          Spacer(),
          const CustomDivider(),
          const Padding(padding: EdgeInsets.all(5.0)),
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
            child: Text("Rafraichir", style: const TextStyle(color: Colors.black, fontSize: 20.0)),
          ),
          Spacer(),
          ButtonBack(pageContext: context),
          const Padding(padding: EdgeInsets.all(5.0)),
          const CustomDivider(),
        ],
      ),
    );
  }
}
