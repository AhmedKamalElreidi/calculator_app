import 'package:calculator_ui/dark_mode/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});
  

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  Color? backGroundColor(String x){
      if(x=='AC' || x=='⌫'|| x=='%'||x=='/' || x=='x' || x=='+' || x=='-'){
         return Colors.grey.withOpacity(0.2);
      }
      if(x=='='){
         return Colors.green;
      }
      return null;
  }
  List<String> operations = [
    'AC',
    '⌫',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '.',
    '0',
    'Ans',
    '=',
  ];
  String input="";
  String result="";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0.0,
        leading: const Text(""),
        title: Text("Calculator",style: TextStyle(fontSize: 25,color:Theme.of(context).colorScheme.secondary ),),
        centerTitle: true,
        actions: [
          IconButton(
          onPressed: (){
            Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
        },
        icon: Icon(Icons.dark_mode_outlined,size: 30,color:Theme.of(context).colorScheme.secondary ))
        ],
      ),
      body: Column(
        children: [
         const SizedBox(height: 10,),
          Expanded(
            flex: 1,
            child: Container(
              margin:const EdgeInsets.all(5),
              width: double.infinity,
              child:  Text(input,textAlign:TextAlign.left,style: TextStyle(fontSize: 40,color:Theme.of(context).colorScheme.secondary),),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin:const EdgeInsets.all(5),
              width: double.infinity,
              child: Text(result,textAlign:TextAlign.right,style: TextStyle(fontSize: 40,color: Theme.of(context).colorScheme.secondary),),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                    color:Theme.of(context).colorScheme.primary,
                      borderRadius:const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                    ),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: operations.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                 itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      if(operations[index]=='AC'){
                          setState(() {
                            input='';
                            result='';
                        });
                      }else if (operations[index]=='⌫'){
                        setState(() {
                              input=input.substring(0,input.length-1);
                        });
                      }else if (operations[index]=='Ans'){
                        setState(() {
                              input=result;
                              result="";
                        });
                      }else if (operations[index]=='%'||
                      operations[index]=='/'||
                      operations[index]=='x'||
                      operations[index]=='+'||
                      operations[index]=='-') {
                        if(input.endsWith('%') || input.endsWith('/')||
                        input.endsWith('x') || input.endsWith('+') || input.endsWith('-')){
                            null;
                        }else{
                          setState(() {
                              input=input+operations[index];
                          });
                        }
                      }else if (operations[index]=='='){
                          //math_expressions libraryخاصين بى ال
                            Expression exp= Parser().parse(input);
                            double finalResult=exp.evaluate(EvaluationType.REAL, ContextModel());
                            setState(() {
                              result=finalResult.toString();
                            });
                        }else{
                        setState(() {
                              input=input+operations[index];
                        });
                      }
                        
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                      color: backGroundColor(operations[index]),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      alignment: Alignment.center,
                      child: Text(operations[index],style: const TextStyle(fontWeight:FontWeight.bold,fontSize: 20),)
                      ),
                  );
                },
                ),
            ),
          ),
        ],
      ),
    );
  }
}