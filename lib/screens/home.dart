import 'package:calculator_app/components/button.dart';
import 'package:calculator_app/components/clear_button.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var expression = '';
  var result = '';

  bool isOperator(String value) {
    if (value == '%' ||
        value == '÷' ||
        value == '×' ||
        value == '-' ||
        value == '+' ||
        value == '=') {
      return true;
    }
    return false;
  }

  List buttonsText = [
    'C', '()', '%', '/',
    '7', '8', '9', 'x',
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
            decoration: const BoxDecoration(color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0, top: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        alignment: Alignment.centerRight,
                        child:  Text(expression,style: TextStyle(color: HexColor("DE9D9B"), fontSize: 30),)
                      ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(result, style: TextStyle(color: HexColor("DE9D9B"), fontSize: 40)),
                      
                    ),
                    ClearButton(onTaped: (){
                        setState(() {
                          expression = expression.substring(0, expression.length - 1);
                        });
                    },)
                  ]),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GridView.count(
            padding: const EdgeInsets.all(15),
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: buttonsText
                .map((text) => Button(
                    buttonTap: (){
                      setState(() {
                        expression += text;
                      });
                    },
                    text: text,
                    textColor: isOperator(text)
                        ? HexColor("DE9D9B")
                        : HexColor("E8C1A2")))
                .toList(),
          ),

          // child:
        )
      ]),
    );
  }
}
