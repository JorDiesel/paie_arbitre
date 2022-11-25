import 'package:flutter/material.dart';
import 'package:paie_arbitre/Vues/detailMatch.dart';
import 'package:paie_arbitre/Widgets/Button/buttonBack.dart';
import 'package:paie_arbitre/Widgets/FormInputs/textForm.dart';
import 'package:paie_arbitre/Widgets/divider.dart';

import '../Widgets/FormInputs/dropdown.dart';
import '../Widgets/textTitle.dart';

class Consult extends StatefulWidget {
  const Consult({super.key});

  @override
  State<Consult> createState() => _Consult();
}

class _Consult extends State<Consult>{
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  TextEditingController moisController = new TextEditingController();
  List<String> listMois = <String>["Octobre", "Novembre", "Décembre", "Janvier", "Février", "Mars", "Avril"];

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
          DropdownButtonWidget(listType: listMois, controleur: moisController,),
          Container(
            width: 600,
            height: 475,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints){
                  return SizedBox(
                    width: constraints.maxWidth / 2,
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: ListView.builder(
                        primary: true,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 75,
                            color: index.isEven
                                ? Color.fromRGBO(120, 120, 120, 100)
                                : Color.fromRGBO(80, 80, 80, 100),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMatch()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    children: [
                                      Spacer(),
                                      TextForm(text: "Match numéro 1234"),
                                      Spacer()
                                    ]
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
            ),
          ),
          Spacer(),
          const CustomDivider(),
          const Padding(padding: EdgeInsets.all(5.0)),
          ButtonBack(pageContext: context),
          const Padding(padding: EdgeInsets.all(5.0)),
          const CustomDivider(),
        ],
      ),
    );
  }
}