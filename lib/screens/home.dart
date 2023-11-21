import 'package:calculator_app/components/button.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  bool isOperator(String value) {
    if (value == '%' || value == '÷' || value == '×' || value == '-' || value == '+' || value == '='){
      return true;
    }
    return false;
  }


 List buttonsText = [
    'C', '()', '%', '÷',
    '7', '8', '9', '×',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '.', '0', ',', '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        Expanded(
          flex: 2,
          child: GridView.count(
            padding: const EdgeInsets.all(15),
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: buttonsText.map((text) => Button(
              text: text, 
              textColor: isOperator(text) ? HexColor("DE9D9B"): HexColor("E8C1A2"))
              ).toList(),
          ),

          // child:
        )
      ]),
    );
  }
}
