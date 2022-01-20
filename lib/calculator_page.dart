import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
   CalculatorPage({Key? key}) : super(key: key);

  List buttonsList = [
    'AC',
    'DEl',
    '%', '/', '7', '8', '9', '*', '4', '5', '6', '-', '1','2','3','+','^','0','.','=',
  ];

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
            Text('0', style: TextStyle(fontSize: 40,),),
            const Divider(),
            GridView.builder(
              shrinkWrap: true,
              itemCount: buttonsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount : 4,
              ),


              itemBuilder: (context, index){
                return Text('0');
              },
            ),
          ],
        ),
      ),
    );
  }
}
