import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  final TextEditingController controller;

  const DatePicker({required this.controller, super.key});

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: TextField(
        controller: controller,
        readOnly: true,
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.yellowAccent),
          ),
        ),
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context, initialDate: DateTime.now(),
              firstDate: DateTime(2022),
              lastDate: DateTime(2024)
          );
          if(pickedDate != null ){
            String formattedDate = pickedDate.year.toString() + "-" + (pickedDate.month < 10 ? "0" + pickedDate.month.toString() : pickedDate.month.toString()) + "-" + (pickedDate.day < 10 ? "0" + pickedDate.day.toString() : pickedDate.day.toString());
            //String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            controller.text = formattedDate;
          }
        },
      ),
    );
  }
}