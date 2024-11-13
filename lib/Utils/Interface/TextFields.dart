import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomColors.dart';

class TextFields {

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