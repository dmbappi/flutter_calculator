import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
   CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  List buttonsList = [
    'AC',
    'DEl',
    '%', '/', '7', '8', '9', '*', '4', '5', '6', '-', '1','2','3','+','^','0','.','=',
  ];

  String expression = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(expression, style: TextStyle(fontSize: 40,),),
            const Divider(),
            GridView.builder(
              shrinkWrap: true,
              itemCount: buttonsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount : 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),


              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){

                    setState(() {
                      if(buttonsList[index] == "AC"){
                        expression = '';
                      }else if (buttonsList[index] == "DEL"){

                       expression = expression.substring(0,expression.length -1);
                      }else if (buttonsList[index] == "="){
                        Parser p = Parser();
                        Expression parsedExp = p.parse(expression);
                        ContextModel cm = ContextModel();
                        double eval =
                        parsedExp.evaluate(EvaluationType.REAL, cm);
                        expression = eval.toString();
                      }
                      else{
                        expression = expression + buttonsList[index];
                      }

                    });

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(buttonsList[index], style: TextStyle(
                        fontSize: 26
                      ),),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
