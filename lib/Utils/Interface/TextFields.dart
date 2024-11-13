import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomColors.dart';

/// A utility class for creating custom text fields with icons.
///
/// The `TextFields` class provides a method to create a stylized text field with an icon
/// on the left side. You can customize the appearance of the text field, such as border color,
/// text color, icon size, cursor color, and more.
///
/// Example usage:
/// ```dart
/// TextFields.drawTextFieldWithIcon(
///   icon: Icons.search,
///   width: 300,
///   height: 50,
///   placeholder: "Search...",
///   onChanged: (text) { print(text); }
/// );
/// ```
class TextFields {

  /// Draws a custom text field with an icon.
  ///
  /// This method allows you to create a text field with various customizable properties:
  /// - Icon: Choose an icon to display on the left side of the field.
  /// - Text Field: Customize text color, cursor color, alignment, font size, and more.
  /// - Border: Set the color and width of the border around the text field.
  ///
  /// **Note**: The icon and text field are aligned within the same row, with the icon on the left
  /// and the text field filling the remaining space.
  ///
  /// Parameters:
  /// - `icon`: The icon to be displayed on the left side of the text field.
  /// - `width`: The width of the text field.
  /// - `height`: The height of the text field.
  /// - `placeholder`: The placeholder text to be shown inside the text field.
  /// - `controller`: The `TextEditingController` for managing the text (optional).
  /// - `borderColor`: The color of the text field's border (default is `Colors.black`).
  /// - `iconColor`: The color of the icon (default is `CustomColors.delftBlue`).
  /// - `cursorColor`: The color of the text cursor (default is `CustomColors.tropicalIndigo`).
  /// - `textColor`: The color of the text inside the text field (default is `Colors.black`).
  /// - `borderWidth`: The width of the text field's border (default is `3`).
  /// - `iconSize`: The size of the icon (default is `35.0`).
  /// - `fieldFontSize`: The font size of the text inside the text field (default is `17`).
  /// - `fieldTextAlignment`: The alignment of the text inside the text field (default is `TextAlign.left`).
  /// - `onChanged`: A callback function that is called when the text changes.
  ///
  /// Returns:
  /// A `SizedBox` widget containing a `Row` with an icon on the left and a Cupertino text field on the right.
  static Widget drawTextFieldWithIcon(
    IconData icon,
    double width,
    double height,
    {
      required String? placeholder,
      TextEditingController? controller,
      Color? borderColor = Colors.black,
      Color? iconColor = CustomColors.delftBlue,
      Color? cursorColor = CustomColors.tropicalIndigo,
      Color? textColor = Colors.black,
      double? borderWidth = 3,
      double? iconSize = 35.0,
      double? fieldFontSize = 17,
      TextAlign? fieldTextAlignment = TextAlign.left,
      required Function(String) onChanged,
    }) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(height/2),
          ),
          border: Border.all(
            color: borderColor!,
            width: borderWidth!,
            style: BorderStyle.solid
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Icon(
                icon,
                color: iconColor,
                size: iconSize,
              ),
            ),
            SizedBox(
              width: width - 60,
              height: height/2 + 10,
              child:
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(5, 0, 25, 0),
                child: CupertinoTextField(
                  controller: controller ?? TextEditingController(),
                  cursorColor: cursorColor,
                  decoration: const BoxDecoration(color: Colors.white),
                  placeholder: placeholder,
                  maxLines: 1,
                  onChanged: onChanged,
                  textAlign: fieldTextAlignment!,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: fieldFontSize,
                    color: textColor,
                  ),
                ),
              )
            )
          ],
        ),
      )
    );
  }

}