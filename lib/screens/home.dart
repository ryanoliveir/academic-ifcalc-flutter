import 'package:calculator_app/components/button.dart';
import 'package:calculator_app/components/clear_button.dart';
import 'package:calculator_app/components/history_button.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_expressions/math_expressions.dart';


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
        value == '+' ) {
      return true;
    }
    return false;
  }


  void clearAll(){
    setState(() {
      expression = "";
      result = "";
    });
  }

  void eraseExpression(){
    if (expression.isNotEmpty){
      print("List");
      setState(() {
        expression = expression.substring(0, expression.length - 1);
      });
    } else {
      setState(() {
        result = "";
      });
    }
  }


  String formatResult(double value) {
    if(value % 1 == 0) {
      return value.toInt().toString();
    } 
    return value.toString();
  }

  void evaluate(){

    if (expression == "") return;
    String finalExpression = expression;

    finalExpression = finalExpression.replaceAll('×', '*');
    finalExpression = finalExpression.replaceAll('÷', '/');
    finalExpression = finalExpression.replaceAll('÷', '/');


    print(finalExpression);

    Parser parser = Parser();
    Expression exp = parser.parse(finalExpression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);


    print('Expression: $exp');
    print('Evaluated expression: $eval\n  (with context: $cm)');

    setState(() {
      result = formatResult(eval);
    });
  }

  List buttonsText = [
    'C', '(', ')', '÷',
    '7', '8', '9', '×',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '+/-', '0', '.', '=',
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
                        child:  Text(expression,style: TextStyle(color: HexColor("E8C1A2"), fontSize: 30),)
                      ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(result, style: TextStyle(color: HexColor("DE9D9B"), fontSize: 40)),
                      
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HistoryButton(onTaped: (){}),
                        ClearButton(onTaped: eraseExpression)
                      ],
                    )
                  ]),
            ),
          ),
        ),
        SizedBox(
          width: 350,
          child: Divider(
          color: Colors.grey[900],
          thickness: 2,
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
                .map((text) =>  
                text == 'C'
                ? Button(textColor: HexColor("AF2F2C"), text: text, buttonTap: clearAll)
                : text == "=" ? Button(
                    textColor:  HexColor("AF2F2C"), 
                    text: text, buttonTap: evaluate
                    )
                  : Button(
                    textColor: isOperator(text) ? HexColor("DE9D98") : HexColor("E8C1A2"), 
                    text: text, buttonTap: 
                    (){
                      setState(() {
                        expression += text;
                      });
                    }
                  )
                ).toList()
          ),
          // child:
        )
      ]),
    );
  }
}
