import 'package:flutter/material.dart';
import 'package:shortly/Utils/Interface/Labels.dart';

/// A utility class for creating customizable buttons with icons.
///
/// The `Buttons` class provides a static method, `drawButtonWithIcon`,
/// which allows for the creation of an `ElevatedButton` with both an icon
/// and label. This method provides flexibility in button appearance and behavior,
/// making it suitable for various use cases.
///
/// Example usage:
/// ```dart
/// Buttons.drawButtonWithIcon(
///   icon: Icons.add,
///   title: "Add Item",
///   titleColor: Colors.blue,
///   backgroundColor: Colors.white,
///   overlayColor: Colors.blueAccent,
///   iconColor: Colors.blue,
///   cornerRadius: 8.0,
///   iconSize: 30.0,
///   titleFontSize: 18.0,
///   isDisabled: false,
///   onPressed: () {
///     // Define button action here
///   },
/// );
/// ```
class Buttons {

  /// Creates an `ElevatedButton` with an icon and label.
  ///
  /// - [icon]: The icon displayed on the button. Defaults to `Icons.remove_circle_outline_outlined`.
  /// - [title]: The text label displayed on the button. Defaults to an empty string.
  /// - [titleColor]: Color of the title text. Defaults to `Colors.white`.
  /// - [backgroundColor]: Background color of the button. Defaults to `Colors.black`.
  /// - [overlayColor]: Color shown when the button is pressed. Defaults to `Colors.grey`.
  /// - [iconColor]: Color of the icon. Defaults to `Colors.white`.
  /// - [cornerRadius]: Radius of the button corners. Defaults to `0.0`.
  /// - [iconSize]: Size of the icon. Defaults to `25.0`.
  /// - [titleFontSize]: Font size of the title text. Defaults to `16.0`.
  /// - [isDisabled]: Disables the button if `true`, preventing the [onPressed] callback. Defaults to `false`.
  /// - [onPressed]: Callback function triggered on button press. This is a required parameter.
  ///
  /// Returns:
  /// - A `Widget` representing an `ElevatedButton.icon` styled with the specified properties.
  ///
  /// Notes:
  /// - If [isDisabled] is set to `true`, the button will not respond to press events.
  /// - This method simplifies button creation with consistent styling across the app.
  static Widget drawButtonWithIcon(
  {
    IconData icon = Icons.remove_circle_outline_outlined,
    String title = "",
    Color? titleColor = Colors.white,
    Color? backgroundColor = Colors.black,
    Color? overlayColor = Colors.grey,
    Color? iconColor = Colors.white,
    double? cornerRadius = 0.0,
    double? iconSize = 25.0,
    double? titleFontSize = 16.0,
    bool isDisabled = false,
    required Function()? onPressed,
  }) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) => backgroundColor),
        overlayColor: WidgetStateProperty.resolveWith((states) => overlayColor),
        shape: WidgetStateProperty.resolveWith((states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? 0.0)
          )
        ),
        )
      ),
      onPressed: !isDisabled ? onPressed : () {},
      icon: Container(
        alignment: Alignment.center,
        child: Center(
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        )
      ),
      label: Container(
        alignment: Alignment.center,
        child: Labels.drawBasicLabel(
          title,
          color: titleColor,
          optionalFontSize: titleFontSize
        ),
      ),
    );
  }

}