import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'CustomColors.dart';
import 'Labels.dart';

class CustomViews {

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