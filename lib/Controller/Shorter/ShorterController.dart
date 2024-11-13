import 'package:flutter/material.dart';
import 'package:shortly/Config/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shortly/Utils/Interface/Buttons.dart';
import 'package:shortly/Utils/Interface/CustomColors.dart';
import 'package:shortly/Utils/Interface/Labels.dart';
import 'package:shortly/Utils/Interface/TextFields.dart';

import '../Home/Onboarding/OnboardingController.dart';

class ShorterController extends StatefulWidget {
  const ShorterController({super.key});

  @override
  State<ShorterController> createState() => _ShorterControllerState();
}

class _ShorterControllerState extends State<ShorterController> {

  // The controller for the url text field
  final TextEditingController urlTextFieldController = TextEditingController();

  String? errorText;

  /// The regular expression to validate an url correctly
  final RegExp urlRegExp = RegExp(
    r'^(https?:\/\/)?'               // Allows optional http:// or https://
    r'(www\.)?'                      // Allows optional www.
    r'([a-zA-Z0-9-]+\.)'             // Subdomain or domain
    r'([a-zA-Z]{2,63})'              // Domain extension like .com, .org
    r'(\/[-a-zA-Z0-9@:%_+.~#?&//=]*)?$' // Path and query parameters
  );

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final didShowOnboarding = await checkIfFirstTimeUser();
      if(!didShowOnboarding) {
        if(context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute (builder: (BuildContext context) => const OnboardingController(),
            ),
          );
        }
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
                  child: Labels.drawBasicLabel(
                    "Willkommen zurück!",
                    bold: true,
                    optionalFontSize: 34,
                    color: Colors.black
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Labels.drawBasicLabel(
                "Trage deine URL ein um sie zu kürzen:",
                color: CustomColors.silver,
                optionalFontSize: 15
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
              alignment: Alignment.center,
              child: TextFields.drawTextFieldWithIcon(
                onChanged: (currentInput) {
                  _validateUrl(currentInput);
                },
                Icons.link,
                MediaQuery.of(context).size.width - 50,
                60,
                placeholder: "https://www.example.com",
                controller: urlTextFieldController,
                iconColor: CustomColors.tropicalIndigo
              ),
            ),
            if (errorText != null) Container(
              padding: const EdgeInsets.only(left: 25.0, top: 5.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.info_outline,
                    size: 20.0,
                    color: CustomColors.fireEngineRed,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Labels.drawBasicLabel(
                      errorText ?? "",
                      color: CustomColors.silver,
                      optionalFontSize: 13,
                    ),
                  )
                ],
              ),
            ) else Container(),
            Container(
              padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                height: 50,
                child: Buttons.drawButtonWithIcon(
                  onPressed: () {

                  },
                  title: "URL kürzen",
                  icon: Icons.add_circle_outline,
                  backgroundColor: CustomColors.fireEngineRed,
                  cornerRadius: 25.0,
                  isDisabled: errorText != null
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Method to validate the URL and update the error message
  void _validateUrl(String value) {
    setState(() {
      if (value.isEmpty) {
        errorText = 'Bitte gib eine URL ein';
      } else if (!urlRegExp.hasMatch(value)) {
        errorText = 'Bitte überprüfe deine URL';
      } else {
        errorText = null;  // Clear error if valid
      }
    });
  }

  /// This function will check if the user is accessing the app for the first time and will also update the state
  Future<bool> checkIfFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool didShowOnboarding = prefs.getBool(Constants.didShowNearFieldOnBoarding) ?? false;
    await prefs.setBool(Constants.didShowNearFieldOnBoarding, true);
    return didShowOnboarding;
  }

}
