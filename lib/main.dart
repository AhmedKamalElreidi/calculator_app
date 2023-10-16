import 'package:calculator_ui/calculator.dart';
import 'package:calculator_ui/dark_mode/theme_provider.dart';
import 'package:calculator_ui/splash-view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  
  runApp(
    ChangeNotifierProvider(
      create:(context)=>ThemeProvider() ,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        "/CalculatorHome": (context) => const CalculatorHome(),
      },
      // home: CalculatorHome(),
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

