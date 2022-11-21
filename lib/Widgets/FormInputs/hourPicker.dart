import 'package:flutter/material.dart';

class HourPicker extends StatelessWidget {
  final TextEditingController controller;

  const HourPicker({required this.controller, super.key});

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
          TimeOfDay? pickedHour = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now()
          );
          if(pickedHour != null ){
            String formattedDate = pickedHour.hour.toString() + "h" + (pickedHour.minute < 10 ? "0" + pickedHour.minute.toString() : pickedHour.minute.toString());
            //String formatTime = TimeOfDayFormat("HH:mm").format(pickedHour);
            controller.text = formattedDate;
          }
        },
      ),
    );
  }
}