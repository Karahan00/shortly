import 'dart:ui';

/// A utility class that defines custom colors for consistent styling across the application.
///
/// The `CustomColors` class provides a set of predefined color constants using the
/// `Color.fromRGBO` format. Each color is named descriptively to represent its
/// intended usage or appearance.
///
/// Example usage:
/// ```dart
/// Container(
///   color: CustomColors.fireEngineRed,
///   child: Text("Alert!", style: TextStyle(color: CustomColors.silver)),
/// );
/// ```
class CustomColors {

  /// A light grey color for general purposes.
  static const Color silver = Color.fromRGBO(193, 193, 193, 1);

  /// A vibrant red color, often used for alerts or warnings.
  static const Color fireEngineRed = Color.fromRGBO(193, 41, 46, 1);

  /// A dark blue color with a slight grey tint, suitable for headings and emphasis.
  static const Color delftBlue = Color.fromRGBO(56, 64, 95, 1);

  /// A bright green color, often used for success messages or confirmations.
  static const Color screamingGreen = Color.fromRGBO(97, 255, 126, 1);

  /// A light indigo shade, useful for buttons or highlighted elements.
  static const Color tropicalIndigo = Color.fromRGBO(125, 131, 255, 1);

}