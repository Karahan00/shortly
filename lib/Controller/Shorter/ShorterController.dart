import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shortly/Config/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shortly/Controller/Provider/authProvider.dart';
import 'package:shortly/Controller/Provider/bitlyLinkProvider.dart';
import 'package:shortly/Utils/Interface/Buttons.dart';
import 'package:shortly/Utils/Interface/CustomColors.dart';
import 'package:shortly/Utils/Interface/Labels.dart';
import 'package:shortly/Utils/Interface/TextFields.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shortly/Utils/Interface/ToastNotification.dart';
import '../Home/Onboarding/OnboardingController.dart';
import 'package:toastification/toastification.dart';

/// Controller for the URL shortening screen, allowing users to input a URL
/// and shorten it using a Bitly service. This screen also handles user
/// onboarding on first app launch.
class ShorterController extends ConsumerStatefulWidget {
  const ShorterController({super.key});

  @override
  ConsumerState<ShorterController> createState() => _ShorterControllerState();
}

class _ShorterControllerState extends ConsumerState<ShorterController> {

  // Controller for the URL input field
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

    // Check if the user is a first-time user and show onboarding if needed
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

    return ToastificationWrapper(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Welcome label
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
                    child: Labels.drawBasicLabel(
                      "Willkommen zurück!",
                      bold: true,
                      optionalFontSize: 30,
                      color: Colors.black
                    ),
                  )
                ],
              ),
              // Description label
              Container(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Labels.drawBasicLabel(
                  "Trage deine URL ein um sie zu kürzen:",
                  color: CustomColors.silver,
                  optionalFontSize: 15
                ),
              ),
              // URL input field
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
              // Error message if URL is invalid
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
              // Button to shorten URL
              Container(
                padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 50,
                  child: Buttons.drawButtonWithIcon(
                    onPressed: () {
                      shortUrl(ref);
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
      ),
    );
  }

  /// Method to validate the URL and update the error message
  void _validateUrl(String value) {
    setState(() {
      // Ensure the URL starts with 'https://'
      if (value.isEmpty) {
        errorText = 'Bitte gib eine URL ein';
      } else if (!value.startsWith('https://')) {
        // Automatically prepend 'https://' if missing
        urlTextFieldController.text = 'https://$value';
        urlTextFieldController.selection = TextSelection.fromPosition(TextPosition(offset: urlTextFieldController.text.length));
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

  /// Handles the URL shortening logic and updates the UI accordingly.
  void shortUrl(WidgetRef ref) async {

    final longUrl = urlTextFieldController.text;
    final shortenUrl = await ref.read(shortUrlProvider(longUrl).future);

    if(shortenUrl != null) {

      final currentUidAsyncValue = await ref.read(currentUidProvider.future);

      // Copy shortened URL to clipboard
      Clipboard.setData(ClipboardData(text: shortenUrl));

      if(currentUidAsyncValue != null) {

        Map<String, dynamic> bitlyLinkUserDataValues = {
          Constants.longUrl: longUrl,
          Constants.shortUrl: shortenUrl,
          Constants.creationTimeStamp: DateTime.now().millisecondsSinceEpoch/1000
        };

        final success = await ref.read(bitlyServiceProvider).uploadBitlyLink(currentUidAsyncValue, bitlyLinkUserDataValues);

        if(success) {
          if(context.mounted) {
            ToastNotification.showSuccessNotification(context, "URL gekürzt", "Link erfolgreich in der Bibliothek gespeichert und in die Zwischenablage kopiert!");
          }
        }
        else {
          ToastNotification.showErrorNotification(context, "Fehler beim speichern", "Die URL wurde in deine Zwischenablage kopiert aber konnte nicht gespeichert werden.");
        }
      }

    }
    else {
      ToastNotification.showErrorNotification(context, "Fehler beim kürzen", "Dein Link konnte nicht gekürzt werden. Bitte versuche es erneut.");
    }

  }

}
