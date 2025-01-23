import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat _numberFormat = NumberFormat.currency(
    symbol: '\$',
    decimalDigits: 2,
  );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Only keep digits
    String newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Convert to double (divide by 100 to handle decimals)
    double value = double.parse(newText) / 100;

    // Format the number
    String formatted = _numberFormat.format(value);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
} 