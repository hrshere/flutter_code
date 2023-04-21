import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:listview_navigation_api/modal_class/modal_class_one.dart';

class ServiceApi {
  static Future<List<Photo>> fetchPhotos(http.Client client) async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    return compute(parsePhotos, response.body);
  }

  static List<Photo> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }
}
