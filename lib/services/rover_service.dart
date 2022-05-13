import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:exospace_app/models/models.dart';

class RoverService extends ChangeNotifier {

  final String _baseUrl = 'api.nasa.gov';
  final String endpoint = '/mars-photos/api/v1/rovers/curiosity/photos';
  final String _apiKey = dotenv.env['API_KEY'] as String;
  final DateTime currentDate = DateTime.now();

  bool thereArePhotos = true;
  List<Photo> roverPhotos = [];
  bool isLoading = false;

  RoverService() {
    getPhotosByDate('${ currentDate.year }-${ currentDate.month }-${ currentDate.day }');
  }

  Future<List<Photo>> getPhotosByDate( String earthDate ) async {

    isLoading = true;
    notifyListeners();

    final url = Uri.https(
      _baseUrl,
      endpoint,
      {
        'api_key': _apiKey,
        'earth_date': earthDate
      }
    );
    final response = await http.get(url);
    final photos = Rover.fromJson(response.body);

    if (photos.photos.isEmpty) {
      thereArePhotos = false;
      notifyListeners();
    }

    if ( photos.photos.isNotEmpty ) {
      thereArePhotos = true;
      clearListPhoto();
    }

    roverPhotos.addAll([ ...photos.photos ]);
    isLoading = false;
    
    notifyListeners();

    return roverPhotos;
  }
  void clearListPhoto() {
    roverPhotos = [];
    notifyListeners();
  }
}
