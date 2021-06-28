import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Screen extends StatefulWidget {

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
var result = "";

output(){
  Parser P = Parser();
  Expression exp = P.parse(result);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  setState(() {
      result = eval.toString();
    });
}
Widget btn(var textt){
  return ElevatedButton(onPressed: (){
      setState(() {
              result += textt;
            });
  }, child: Text(textt));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: [
            Text(result,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("1"),
                btn("2"),
                btn("3"),
                 btn("4"),
                
              ],
            ),Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("5"),
                btn("6"),
                btn("7"),
                 btn("8"),
                
              ],
            ),Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("9"),
                btn("0"),
                ElevatedButton(onPressed: output, child: Text("=")),
                 ElevatedButton(onPressed: (){
                  setState(() {
                                      result="";
                                    });
                }, child: Text("AC"))
              
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("+"),
                btn("-"),
                btn("*"),
                btn("/"),
                
              
              ],
            ),
          ],),
        ),
    );
  }
}


