import 'package:dio/dio.dart';

class BitlyService {

  final Dio _dio;

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

}