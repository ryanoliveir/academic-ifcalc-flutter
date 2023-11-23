
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HistoryButton extends StatelessWidget {

  final VoidCallback onTaped;

  const HistoryButton({required this.onTaped, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaped,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Container(
          alignment: Alignment.centerRight,
          child: Icon(Icons.history, color: HexColor("DE9D9B"), size: 27,
        ),
      ),
    )
    );
  }
}