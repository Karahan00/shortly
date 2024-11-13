import 'package:flutter/material.dart';
import 'package:shortly/Controller/Provider/bitlyLinkProvider.dart';
import 'package:shortly/Utils/Interface/CustomViews.dart';
import 'package:shortly/Utils/Interface/Labels.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shortly/Utils/common/DateTimeUtils.dart';
import '../../Utils/Interface/CustomColors.dart';
import '../Home/Onboarding/OnboardingController.dart';
import '../Provider/authProvider.dart';

class LibraryController extends ConsumerStatefulWidget {

  const LibraryController({super.key});

  @override
  ConsumerState<LibraryController> createState() => _LibraryControllerState();
}

class _LibraryControllerState extends ConsumerState<LibraryController> {


@override
Widget build(BuildContext context) {
  // Watch `currentUidProvider` to get the user's UID asynchronously
  final currentUidAsyncValue = ref.watch(currentUidProvider);

  return Scaffold(
    body: SafeArea(
      child: currentUidAsyncValue.when(
        data: (uid) {
          if (uid == null) {
            // Handle the case where the user is not logged in or UID is null
            Navigator.push(context, MaterialPageRoute (builder: (BuildContext context) => const OnboardingController(),),);
          }

          // Watch `bitlyLinksProvider` only once UID is available
          final bitlyLinksAsyncValue = ref.watch(bitlyLinksProvider(uid!));

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Header with library title
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
                    child: Labels.drawBasicLabel(
                      "Deine Bibliothek",
                      bold: true,
                      optionalFontSize: 34,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              // Subheader with description of the library
              Container(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Labels.drawBasicLabel(
                  "Hier speichern wir deine zuletzt erstellten URL's damit du sie jederzeit kopieren kannst.",
                  color: CustomColors.silver,
                  optionalFontSize: 15,
                  maxLines: 3,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(left: 25.0, top: 15.0, right: 25.0),
                  child: bitlyLinksAsyncValue.when(
                    data: (bitlyLinks) {
                      if (bitlyLinks == null || bitlyLinks.isEmpty) {
                        return CustomViews.buildCustomNoDataView();
                      }
                      // Display list of Bitly links
                      return ListView.builder(
                        itemCount: bitlyLinks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 75,
                                  padding: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Icon(
                                          Icons.link,
                                          size: 30,
                                          color: CustomColors.tropicalIndigo,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.only(left: 15.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Labels.drawBasicLabel(
                                                  bitlyLinks[index].longUrl,
                                                  optionalFontSize: 17,
                                                  color: CustomColors.delftBlue,
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Labels.drawBasicLabel(
                                                  bitlyLinks[index].shortUrl,
                                                  optionalFontSize: 16,
                                                  color: CustomColors.silver,
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Labels.drawBasicLabel(
                                                  getTimeAgoDisplay(bitlyLinks[index].creationTime),
                                                  optionalFontSize: 14,
                                                  color: CustomColors.silver,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: const Icon(Icons.chevron_right),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(),
                              ],
                            ),
                            onTap: () {
                              // Optionally implement detail view on tap
                            },
                          );
                        },
                      );
                    },
                    error: (e, st) => CustomViews.buildCustomNoDataView(),
                    loading: () => const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => CustomViews.buildCustomNoDataView()
      ),
    ),
  );
}

}
