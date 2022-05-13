import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:exospace_app/models/models.dart';

class ExoplanetService extends ChangeNotifier {

  final String _baseUrl = 'https://exoplanetarchive.ipac.caltech.edu/TAP/sync';
  final String query = 'select+pl_name,disc_year,discoverymethod,pl_orbper,pl_rade,pl_massj+from+ps+where+disc_year+=+2022';
  final String format = 'format=json';
  final List<Exoplanet> listExoplanet = [];

  bool isLoading = false;

  ExoplanetService() {
    loadPlanets();
  }

  Future loadPlanets() async {

    if ( listExoplanet.isNotEmpty ) {
      isLoading = false;
      notifyListeners();
      return;
    }

    isLoading = true;
    notifyListeners();

    final url = Uri.parse('$_baseUrl?query=$query&$format');
    final response = await http.get(url);
    final List<dynamic> decodedData = jsonDecode(response.body);

    Map<String, dynamic> map = {};
    Exoplanet planet;

    decodedData.forEach((element) {
      map = element;
      planet = Exoplanet.fromMap(map);
      listExoplanet.add(planet);
    });

    isLoading = false;
    notifyListeners();
  }

}