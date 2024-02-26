import 'package:flutter/material.dart';
import 'package:currency_converter/utils/constants.dart';
import 'package:currency_converter/utils/converter.dart';

class CurrencyConverterWidget extends StatefulWidget {
  const CurrencyConverterWidget({super.key});

  @override
  _CurrencyConverterWidgetState createState() =>
      _CurrencyConverterWidgetState();
}

class _CurrencyConverterWidgetState extends State<CurrencyConverterWidget> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = Converter.convertToINR(double.parse(textEditingController.text));
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(5),
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${Constants.currencyLabel} ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextField(
              controller: textEditingController,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: Constants.hintText,
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                prefixIcon: const Icon(Icons.monetization_on_outlined),
                prefixIconColor: Colors.black,
                filled: true,
                fillColor: Colors.white,
                focusedBorder: border,
                enabledBorder: border,
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: convert,
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(Constants.convertButtonLabel),
            ),
          ],
        ),
      ),
    );
  }
}
