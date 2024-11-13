import 'package:flutter/material.dart';

class Labels {

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