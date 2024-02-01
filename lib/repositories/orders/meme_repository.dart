import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/meme_model.dart';

class MemeRepository {
  Future<Meme> getMeme() async {
    http.Response response =
        await http.get(Uri.parse("https://some-random-api.ml/meme"));
    Map<String, dynamic> singleData = jsonDecode(response.body);
    return Meme.fromJson(singleData);
  }
}
