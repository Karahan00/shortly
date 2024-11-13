import 'package:flutter/material.dart';

/// A utility class for creating and customizing text widgets.
///
/// The `Labels` class provides a method to generate a flexible text widget that can be
/// styled with various properties, such as font size, color, alignment, and more. This helps
/// to create consistent and reusable text styles across the application.
///
/// Example usage:
/// ```dart
/// Labels.drawBasicLabel("Hello, World!");
/// ```
class Labels {

  /// Draws a basic label with customizable text style and properties.
  ///
  /// This method allows you to configure the appearance of the text widget, such as:
  /// - Alignment: The text can be aligned to the left, right, center, etc.
  /// - Font Size: You can specify the size of the text.
  /// - Color: Set the text color to any custom color.
  /// - Max Lines: Limit the number of lines the text should occupy.
  /// - Bold: Optionally make the text bold.
  ///
  /// **Note**: The font used is "Poppins" by default, and "Poppins-Bold" is used if `bold` is `true`.
  ///
  /// Parameters:
  /// - `text`: The text content to be displayed.
  /// - `alignment`: How the text should be aligned (default is `TextAlign.left`).
  /// - `optionalFontSize`: The font size for the text (default is `15`).
  /// - `color`: The color of the text (default is `Colors.white`).
  /// - `maxLines`: The maximum number of lines the text can occupy (default is `1`).
  /// - `bold`: Whether the text should be bold (default is `false`).
  ///
  /// Returns:
  /// A `Text` widget that displays the specified text with the given style.
  static Widget drawBasicLabel(
    String text,
    {
      TextAlign? alignment = TextAlign.left,
      double? optionalFontSize = 15,
      Color? color = Colors.white,
      int? maxLines = 1,
      bool bold = false,
    }) {
    return Text(
      text,
      textAlign: alignment,
      maxLines: maxLines,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: bold ? "Poppins-Bold": "Poppins",
        fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
        fontSize: optionalFontSize,
        color: color,
      ),
    );
  }

}