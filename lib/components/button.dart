import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class Button extends StatelessWidget {

  final textColor;
  final String text;
  final VoidCallback buttonTap;

  const Button({
    required this.textColor,
    required this.text,
    required this.buttonTap,
    super.key  
  });

  @override
  Widget build(BuildContext context) {
    if(text ==  "=") {
      return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color:  HexColor("af2f2c")),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: buttonTap,
          child: Center(
            child: Text(text, style: TextStyle(fontSize: 60, color: HexColor("FFFFFF"))),
          ),
        ),
      ),
    );
    } else {
      return 
      Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: HexColor("1F1A16")),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: buttonTap,
          child: Center(
            child: Text(text, style: TextStyle(fontSize: 30, color: textColor)),
          ),
        ),
      ),
    );
    }
    
  }
}
