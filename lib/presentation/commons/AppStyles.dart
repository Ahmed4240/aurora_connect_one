import 'package:flutter/material.dart';

class AppStyles {
  // fonts sizes
  static const double smallSize = 12.0;
  static const double mediumSize = 16.0;
  static const double largeSize = 20.0;

  // font styles

  static const TextStyle smallTextStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle smallTextStyleOnError = TextStyle(
    color: Colors.white,
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle mediumTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle largeTextStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  // input fields

  static Widget outlinedTextField({
    TextEditingController? controller,
    String? hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        border: OutlineInputBorder(),
      ),
    );
  }

  static Widget filledTextField({
    TextEditingController? controller,
    String? hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        border: OutlineInputBorder(),
        filled: true,
      ),
    );
  }

  static Widget underlinedTextField({
    TextEditingController? controller,
    String? hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        border: const UnderlineInputBorder(),
      ),
    );
  }
}