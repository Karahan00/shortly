import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'CustomColors.dart';
import 'Labels.dart';

/// A utility class for creating custom UI components.
///
/// The `CustomViews` class provides reusable custom widgets that encapsulate common UI
/// elements and patterns used throughout the application. This helps maintain a consistent
/// design and reduces the need to duplicate code.
///
/// Example usage:
/// ```dart
/// CustomViews.buildCustomNoDataView();
/// ```
class CustomViews {

  /// Builds a centered "No Data" view to display when there is no data available.
  ///
  /// This widget includes:
  /// - An SVG image indicating no data, loaded from the `assets/onboarding/no_data_view.svg` path.
  /// - A message text in a silver color, indicating to the user that there are no links available.
  ///
  /// The view is designed to be centered and provides appropriate padding and alignment
  /// for a visually balanced display.
  ///
  /// Returns:
  /// A `Widget` that shows a "No Data" view, typically used when there is no content to display.
  static Widget buildCustomNoDataView(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            "assets/onboarding/no_data_view.svg",
            height: 250,
            width: 250,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
            child: Labels.drawBasicLabel(
              "Ups, es scheint danach auszusehen, dass du noch keine Links hast.",
              optionalFontSize: 15,
              color: CustomColors.silver,
              maxLines: 3,
              alignment: TextAlign.center
            ),
          )
        ],
      ),
    );
  }

}