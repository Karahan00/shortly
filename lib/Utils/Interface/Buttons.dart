import 'package:flutter/material.dart';
import 'package:shortly/Utils/Interface/Labels.dart';

class Buttons {

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