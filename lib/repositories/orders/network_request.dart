import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:state_with_bloc/models/photo_model.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static const String url = "https://jsonplaceholder.typicode.com/photos";

  static List<PhotoModel> parsePhotos(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<PhotoModel> photos = list.map((e) => PhotoModel.fromJson(e)).toList();
    return photos;
  }

  static Future<List<PhotoModel>> fetchPhotos() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(parsePhotos, response.body);
    } else {
      throw Exception("Can't get photos");
    }
  }
}
