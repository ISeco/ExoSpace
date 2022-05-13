import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:exospace_app/models/models.dart';

class PictureDayService extends ChangeNotifier {

  final String _baseUrl = 'api.nasa.gov';
  final String endpoint = '/planetary/apod';
  final String _apiKey = dotenv.env['API_KEY'] as String;

  Future<PictureDay> getPictureDay([ String date = '' ]) async {

    final url = Uri.https(
      _baseUrl,
      endpoint,
      {
        'api_key': _apiKey,
        'date': date
      }
    );
    final response = await http.get(url);
    final picture = PictureDay.fromJson(response.body);

    return picture;
  }

}