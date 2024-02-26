import 'package:flutter/material.dart';
import 'package:currency_converter/utils/constants.dart';
import 'package:currency_converter/widgets/currency_converter_widget.dart';

class CurrencyConverterPage extends StatelessWidget {
  const CurrencyConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Constants.appTitle,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: const CurrencyConverterWidget(),
    );
  }
}
