import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../Backend/Bitly/BitlyService.dart';

// Provider to create and configure Dio
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

// Provider for BitlyService using the dioProvider instance
final bitlyServiceProvider = Provider<BitlyService>((ref) {
  final dio = ref.watch(dioProvider);
  return BitlyService(dio);
});

// FutureProvider for shortening URLs with BitlyService
final shortUrlProvider = FutureProvider.family<String?, String>((ref, longUrl) async {
  final bitlyService = ref.watch(bitlyServiceProvider);
  return await bitlyService.shortenUrl(longUrl);
});