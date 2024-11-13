import 'package:dio/dio.dart';
import 'package:shortly/Config/Constants.dart';
import 'package:shortly/Model/BitlyLink.dart';
import 'package:firebase_database/firebase_database.dart';

/// A service class responsible for interacting with the Bitly API and Firebase Database.
///
/// The `BitlyService` class provides methods for shortening URLs using the Bitly API, uploading shortened links
/// to Firebase Realtime Database, and fetching a stream of saved Bitly links associated with a user's UID.
/// It acts as a central point for all Bitly-related operations in the app.
///
/// Example usage:
/// ```dart
/// final bitlyService = BitlyService(Dio());
/// final short
class BitlyService {

  // A Dio instance for making HTTP requests to the Bitly API
  final Dio _dio;

  // Firebase Database instance for storing and retrieving links
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  /// Constructor to initialize the `Dio` instance with configuration and authentication details.
  ///
  /// The constructor sets the base URL and headers required for interacting with the Bitly API.
  /// The API key is provided as part of the header for authentication.
  ///
  /// - [dio]: The Dio instance used to make HTTP requests to the Bitly API.
   BitlyService(this._dio) {
    _dio.options.baseUrl = 'https://api-ssl.bitly.com/v4/';
    _dio.options.headers = {
      'Authorization': 'Bearer f615249334a118c0128d69d96c07e45c47bddfc4',
      'Content-Type': 'application/json',
    };
  }

  /// Shortens a URL by sending a request to the Bitly API.
  ///
  /// The method sends a POST request to the Bitly API with the given long URL and returns the shortened URL.
  /// If the request is successful (status 200 or 201), the shortened URL is extracted from the response data.
  /// Otherwise, it returns `null`.
  ///
  /// - [longUrl]: The original URL that needs to be shortened.
  ///
  /// Returns:
  /// - A `String?` representing the shortened URL if successful, or `null` if an error occurs.
  Future<String?> shortenUrl(String longUrl) async {
    try {
      final response = await _dio.post('shorten', data: {'long_url': longUrl});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['link']; // Extracts the shortened URL
      } else {
        return null;
      }
    } on DioException catch (exception) {
      return null;
    }
  }

  /// Uploads a shortened Bitly link to the Firebase Realtime Database.
  ///
  /// This method stores the shortened URL along with additional data (e.g., creation time, long URL) in the
  /// Firebase Database under the user's UID. The data is stored at a unique path within the database.
  ///
  /// - [uid]: The unique identifier for the user in Firebase.
  /// - [values]: A map of values representing the Bitly link and associated metadata.
  ///
  /// Returns:
  /// - A `Future<bool>` indicating whether the upload was successful (`true`) or not (`false`).
  Future<bool> uploadBitlyLink(String uid, Map<String, dynamic> values) async {

     DatabaseReference bitlyLinksReference = _firebaseDatabase.ref().child(uid).child(Constants.bitlyLinksReference).push();

     try {
       bitlyLinksReference.update(values);
       return true;
     }
     catch(exception) {
       return false;
     }

  }

  /// Retrieves a stream of Bitly links from Firebase for a specific user.
  ///
  /// This method listens for changes to the user's Bitly links in Firebase and returns a stream of updated
  /// BitlyLink objects whenever the data changes. The stream is mapped to a list of Bitly links, sorted by
  /// creation time in descending order.
  ///
  /// - [uid]: The unique identifier for the user in Firebase, used to fetch the user's Bitly links.
  ///
  /// Returns:
  /// - A `Stream<List<BitlyLink>>` representing the list of Bitly links associated with the user.
  Stream<List<BitlyLink>> getBitlyLinksStream(String? uid) {
    if (uid == null) {
      return Stream.value([]); // Return an empty stream if no uid is provided
    }

    final bitlyLinksReference = _firebaseDatabase.ref().child(uid).child(Constants.bitlyLinksReference);

    // Listen to the changes in Firebase and emit the updated list whenever there are changes
    return bitlyLinksReference.onValue.map((event) {
      List<BitlyLink> fetchedLinks = [];

      if (event.snapshot.exists) {
        for (var bitlyLinkValue in event.snapshot.children) {
          var map = Map<String, dynamic>.from(bitlyLinkValue.value as Map<dynamic, dynamic>);
          BitlyLink bitlyLink = BitlyLink(bitlyLinkValue.key ?? "", map);
          fetchedLinks.add(bitlyLink);
        }

        // Sort the links by creation time
        fetchedLinks.sort((b1, b2) => b1.creationTime.compareTo(b2.creationTime));
      }

      return fetchedLinks;
    });
  }

}