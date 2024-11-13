import 'package:flutter/material.dart';
import 'package:shortly/Utils/Interface/Labels.dart';

import '../../Utils/Interface/CustomColors.dart';

class LibraryController extends StatefulWidget {
  const LibraryController({super.key});

  @override
  State<LibraryController> createState() => _LibraryControllerState();
}

class _LibraryControllerState extends State<LibraryController> {
  @override
  Widget build(BuildContext context) {
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
                    "Deine Bibliothek",
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
                "Hier speichern wir deine zuletzt erstellten URL's damit du sie jederzeit kopieren kannst.",
                color: CustomColors.silver,
                optionalFontSize: 15,
                maxLines: 3
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 25.0, top: 15.0, right: 25.0),
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 60,
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
                                            "www.epppuls.com",
                                            optionalFontSize: 17,
                                            color: CustomColors.delftBlue
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Labels.drawBasicLabel(
                                            "creation::date",
                                            optionalFontSize: 14,
                                            color: CustomColors.silver
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: const Icon(
                                    Icons.chevron_right
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                      onTap: () {
                        // TODO: May implement here an detail view for the selected url cell currently an click will only copy the shorten URL into the clipboard

                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
