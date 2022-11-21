
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget{
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context){
    return const Divider(
      height: 20,
      thickness: 2.5,
      indent: 15,
      endIndent: 15,
      color: Colors.yellow,
    );
  }
}
