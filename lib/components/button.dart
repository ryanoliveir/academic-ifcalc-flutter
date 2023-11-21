import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class Button extends StatelessWidget {

  final textColor;
  final String text;


  const Button({
    required this.textColor,
    required this.text,
    super.key  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: HexColor("1F1A16")),
      child: Center(
        child: Text( text, style: TextStyle(fontSize: 30, color: textColor)),
      )
    );
  }
}
