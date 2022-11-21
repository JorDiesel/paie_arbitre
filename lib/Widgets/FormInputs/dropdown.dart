import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatefulWidget {

  final List<String> listType;
  final TextEditingController controleur;

  const DropdownButtonWidget({required this.listType, required this.controleur ,super.key});

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonWidget> {
  String dropdownValue = "";


  @override
  Widget build(BuildContext context) {
    dropdownValue = widget.listType.first;
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          widget.controleur.text = dropdownValue;
        });
      },
      items: widget.listType.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
