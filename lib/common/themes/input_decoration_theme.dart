import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/colors.dart';

class InputDecorationThemeData {
  InputDecorationThemeData._();

  static InputDecorationTheme lightThemeData = InputDecorationTheme(
    prefixIconColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return CustomColors.primaryColor;
      }
      return CustomColors.primaryColor.withOpacity(0.8);
    }),
    suffixIconColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return CustomColors.primaryColor;
      }
      return CustomColors.primaryColor.withOpacity(0.8);
    }),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(color: CustomColors.primaryColor),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: CustomColors.primaryColor.withOpacity(0.2)),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: CustomColors.primaryColor.withOpacity(0.2)),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: CustomColors.primaryColor),
    ),
    labelStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: CustomColors.highlightText,
    ),
    floatingLabelStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: CustomColors.titleColor,
    ),
  );
}
