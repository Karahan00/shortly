import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

import 'CustomColors.dart';
import 'Labels.dart';

class ToastNotification {

  static void showSuccessNotification(BuildContext context, String title, String description) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      dragToClose: true,
      title: Labels.drawBasicLabel(
        title,
        bold: true,
        color: CustomColors.delftBlue
      ),
      description: Labels.drawBasicLabel(
        description,
        maxLines: 4,
        color: CustomColors.delftBlue
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 5),
    );
  }

  static void showErrorNotification(BuildContext context, String title, String description) {
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.flat,
      dragToClose: true,
      title: Labels.drawBasicLabel(
        title,
        bold: true,
        color: CustomColors.delftBlue
      ),
      description: Labels.drawBasicLabel(
        description,
        maxLines: 4,
        color: CustomColors.delftBlue
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 5),
    );
  }

}