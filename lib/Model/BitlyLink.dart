import 'package:shortly/Config/Constants.dart';

/// A class representing a Bitly link with its associated data.
///
/// This class is used to store and manage information about a shortened
/// Bitly link, including the original long URL, the shortened URL,
/// and the creation timestamp.
///
/// Example usage:
/// ```dart
/// final bitlyLink = BitlyLink('some-key', {
///   Constants.longUrl: 'https://example.com',
///   Constants.shortUrl: 'https://bit.ly/abcd',
///   Constants.creationTimeStamp: 1634412345.0,
/// });
/// ```
class BitlyLink {

  /// The unique key for the Bitly link.
  final String key;
  /// The original long URL before it was shortened.
  late String longUrl;
  /// The shortened Bitly URL.
  late String shortUrl;
  /// The timestamp when the Bitly link was created (in seconds).
  late double creationTime;

  /// Constructs a [BitlyLink] object with the given [key] and [values].
  ///
  /// The [values] map is expected to contain:
  /// - [Constants.longUrl]: The original long URL (String).
  /// - [Constants.shortUrl]: The shortened URL (String).
  /// - [Constants.creationTimeStamp]: The timestamp when the link was created (double).
  ///
  /// Parameters:
  /// - `key`: A unique identifier for the Bitly link.
  /// - `values`: A map containing the link data, including the long URL, short URL, and creation timestamp.
  BitlyLink(this.key, Map<String, dynamic> values) {

    longUrl = values[Constants.longUrl];
    shortUrl = values[Constants.shortUrl];
    creationTime = values[Constants.creationTimeStamp];

  }

}