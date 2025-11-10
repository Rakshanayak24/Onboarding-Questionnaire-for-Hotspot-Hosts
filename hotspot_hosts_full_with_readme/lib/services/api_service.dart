import 'dart:async';
import 'package:dio/dio.dart';
import '../models/experience.dart';

class ApiService {
  final Dio dio;
  ApiService({Dio? dio}) : dio = dio ?? Dio();

  Future<List<Experience>> fetchExperiences() async {
    // In scaffold we return mock list - replace with actual API call
    await Future.delayed(const Duration(milliseconds: 400));
    final mock = List.generate(6, (i) => {
      'id': i+1,
      'name': 'Experience ${i+1}',
      'image_url': 'https://picsum.photos/400/700?random=${i+1}'
    });
    return mock.map((m) => Experience.fromJson(m)).toList();
  }
}
