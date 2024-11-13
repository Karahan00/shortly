import 'package:dio/dio.dart';
import 'package:shortly/Config/Constants.dart';
import 'package:shortly/Model/BitlyLink.dart';
import 'package:firebase_database/firebase_database.dart';

class BitlyService {

  final Dio _dio;

  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

   BitlyService(this._dio) {
    _dio.options.baseUrl = 'https://api-ssl.bitly.com/v4/';
    _dio.options.headers = {
      'Authorization': 'Bearer f615249334a118c0128d69d96c07e45c47bddfc4',
      'Content-Type': 'application/json',
    };
  }

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