import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = _formatCardNumber(newValue.text);
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  String _formatCardNumber(String text) {
    text = text.replaceAll(RegExp(r'\s'), ''); // Remove any existing spaces
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i + 1) % 4 == 0 && i != text.length - 1) {
        buffer.write(' '); // Add space after every 4 characters
      }
    }
    return buffer.toString();
  }
}

class DateFormatInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    final newText = StringBuffer();
    final maxLength = 4;

    if (text.length > maxLength) {
      return oldValue;
    }

    for (int i = 0; i < text.length; i++) {
      if (i == 2 && i < maxLength) {
        newText.write('/'); // Add '/' after the first two digits
      }
      if (i >= maxLength) {
        break;
      }
      newText.write(text[i]);
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
