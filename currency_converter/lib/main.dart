import 'package:flutter/material.dart';
import 'package:currency_converter/currency_converter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.blueGrey,
      ),
      home: const CurrencyConverterPage(),
    );
  }
}
