
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ClearButton extends StatelessWidget {

  final VoidCallback onTaped;

  ClearButton({required this.onTaped, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaped,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          alignment: Alignment.centerRight,
          child: Icon(Icons.backspace_outlined, color: HexColor("DE9D9B"),),
        ),
      ),
    );
  }
}