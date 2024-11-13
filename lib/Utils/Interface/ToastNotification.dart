import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

import 'CustomColors.dart';
import 'Labels.dart';

/// A utility class for showing success and error toast notifications.
///
/// The `ToastNotification` class provides methods to display customized toast notifications
/// with success and error types. These notifications use the `toastification` package to show
/// non-intrusive messages to users. The notifications can display a title and a description,
/// and will automatically close after a set duration.
///
/// Example usage:
/// ```dart
/// ToastNotification.showSuccessNotification(
///   context,
///   "Success",
///   "Your action was completed successfully."
/// );
/// ```
class ToastNotification {

  /// Shows a success notification with a custom title and description.
  ///
  /// This method displays a toast notification with a success type. The notification includes
  /// a title and description which are displayed in the specified colors. The notification
  /// will auto-close after 5 seconds, but users can also drag to close it manually.
  ///
  /// Parameters:
  /// - `context`: The `BuildContext` for showing the notification.
  /// - `title`: The title of the notification, typically indicating success.
  /// - `description`: The description of the notification, providing further details.
  ///
  /// Returns:
  /// - Void. It shows the notification on the screen.
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

  /// Shows an error notification with a custom title and description.
  ///
  /// This method displays a toast notification with an error type. The notification includes
  /// a title and description which are displayed in the specified colors. The notification
  /// will auto-close after 5 seconds, but users can also drag to close it manually.
  ///
  /// Parameters:
  /// - `context`: The `BuildContext` for showing the notification.
  /// - `title`: The title of the notification, typically indicating an error.
  /// - `description`: The description of the notification, providing further details.
  ///
  /// Returns:
  /// - Void. It shows the notification on the screen.
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