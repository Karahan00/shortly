import 'package:shortly/Config/Constants.dart';

class BitlyLink {

  final String key;
  late String longUrl;
  late String shortUrl;
  late double creationTime;

  BitlyLink(this.key, Map<String, dynamic> values) {

    longUrl = values[Constants.longUrl];
    shortUrl = values[Constants.shortUrl];
    creationTime = values[Constants.creationTimeStamp];

  }

}