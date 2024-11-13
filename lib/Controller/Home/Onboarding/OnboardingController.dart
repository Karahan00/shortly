import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:shortly/Utils/Interface/CustomColors.dart';
import 'package:shortly/Utils/Interface/Labels.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shortly/Utils/Interface/ToastNotification.dart';

import '../../../Config/Constants.dart';
import '../../Provider/authProvider.dart';

class OnboardingController extends ConsumerStatefulWidget {

  const OnboardingController({super.key});

  @override
  ConsumerState<OnboardingController> createState() => _OnboardingControllerState();
}

class _OnboardingControllerState extends ConsumerState<OnboardingController> {

  @override
  Widget build(BuildContext context) {

    return Material(
      child: ConcentricPageView(
         colors: const <Color>[CustomColors.delftBlue, CustomColors.tropicalIndigo, CustomColors.delftBlue],
         itemCount: onboardingPages().length, // null = infinity
         physics: const NeverScrollableScrollPhysics(),
         onFinish: ()  {
           createAnonymousUser();
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

  /// Function will reset the onboarding value to make sure the user can try it later again
  void resetOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Constants.didShowNearFieldOnBoarding, false);
  }

  void createAnonymousUser() async {

    final auth = ref.watch(authenticationProvider);

    bool signInSuccessful = await auth.signInUserAnonymously();

    if(signInSuccessful && context.mounted) {
      Navigator.pop(context);
    }
    else {
      resetOnboarding();
      ToastNotification.showErrorNotification(context, "Bitte versuche es erneut", "Wir konnten die App nicht für dich vorbereiten. Bitte versuche es erneut.");
    }

  }

}
