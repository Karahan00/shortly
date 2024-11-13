import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:shortly/Utils/Interface/CustomColors.dart';
import 'package:shortly/Utils/Interface/Labels.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingController extends StatefulWidget {
  const OnboardingController({super.key});

  @override
  State<OnboardingController> createState() => _OnboardingControllerState();
}

class _OnboardingControllerState extends State<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ConcentricPageView(
         colors: const <Color>[CustomColors.delftBlue, CustomColors.tropicalIndigo, CustomColors.delftBlue],
         itemCount: onboardingPages().length, // null = infinity
         physics: const NeverScrollableScrollPhysics(),
         onFinish: ()  {
           Navigator.pop(context);
         },
         nextButtonBuilder: (context) {
           return const Center(
             child: Icon(
               Icons.arrow_forward_rounded,
               color: Colors.white,
               size: 35.0,
             ),
           );
         },

         itemBuilder: (int index) {
            return onboardingPages()[index];
         },
      ),
    );
  }

  /// Function will return the correct page with the correct ui based on the index
  List<Widget> onboardingPages() {
      return [
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/onboarding/internet-global.svg",
                height: 250,
                width: 250,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 15.0),
                child: Labels.drawBasicLabel(
                  "Dein URL-Shorter",
                  bold: true,
                  optionalFontSize: 36
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
                alignment: Alignment.center,
                child: Labels.drawBasicLabel(
                  "Kürze deine Links direkt in der App und speichere Sie auch direkt. Alles Kostenlos und völlig unkompliziert. Probiere es!",
                  optionalFontSize: 16,
                  alignment: TextAlign.center,
                  maxLines: 4
                ),
              )
            ],
          ),
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/onboarding/library.svg",
                height: 250,
                width: 250,
              ),
              Container(
                alignment: Alignment.center,
                child: Labels.drawBasicLabel(
                  "Deine Bibliothek",
                  bold: true,
                  optionalFontSize: 36
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
                alignment: Alignment.center,
                child: Labels.drawBasicLabel(
                  "Wir speichern deine gekürzten Links für dich damit du auf diese zu jederzeit zurück greifen kannst.",
                  optionalFontSize: 16,
                  alignment: TextAlign.center,
                  maxLines: 4
                ),
              )
            ],
          ),
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/onboarding/friends.svg",
                height: 250,
                width: 250,
              ),
              Container(
                alignment: Alignment.center,
                child: Labels.drawBasicLabel(
                  "Teile es mit deinen Freunden!",
                  bold: true,
                  optionalFontSize: 26
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
                alignment: Alignment.center,
                child: Labels.drawBasicLabel(
                  "Sprich darüber mit deinen Freunden und lade sie dazu ein die App auch zu benutzen!",
                  optionalFontSize: 16,
                  alignment: TextAlign.center,
                  maxLines: 4
                ),
              )
            ],
          ),
        ),
      ];
    }

}
