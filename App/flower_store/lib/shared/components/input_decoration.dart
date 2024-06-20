 import 'package:flutter/material.dart';

InputDecoration genericInputDecoration(
  {
    required String label,
    IconData? prefixIcon,
    IconData? suffixIcon
  }
  ) {
  return InputDecoration(
    label: Title(
    color: Colors.grey, child: Text(label)),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white)
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:  BorderSide(color: Colors.grey.shade400)
    ),
    fillColor: Colors.white,
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    prefixIcon: prefixIcon != null ? Align(
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: Icon(prefixIcon),
    ) : null,
    suffixIcon: suffixIcon != null ? Align(
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: Icon(suffixIcon),
    ) : null,
  );
}