import 'package:flutter/material.dart';
import 'package:on_a_trip/common/constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search Destination or Hotel',
        hintStyle: const TextStyle(
          color: CustomColors.highlightText,
        ),
        fillColor: CustomColors.cardColor,
        filled: true,
        suffixIconColor: CustomColors.highlightText,
        suffixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.primaryColor.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.primaryColor.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.primaryColor.withOpacity(1),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
