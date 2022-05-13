// To parse this JSON data, do
//
//     final exoplanet = exoplanetFromMap(jsonString);

import 'dart:convert';

class Exoplanet {
    Exoplanet({
      required this.plName,
      required this.discYear,
      required this.discoverymethod,
      this.plOrbper,
      this.plRade,
      this.plMassj,
    });

    String plName;
    int discYear;
    String discoverymethod;
    double? plOrbper;
    double? plRade;
    double? plMassj;

    factory Exoplanet.fromJson(String str) => Exoplanet.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Exoplanet.fromMap(Map<String, dynamic> json) => Exoplanet(
        plName: json["pl_name"],
        discYear: json["disc_year"],
        discoverymethod: json["discoverymethod"],
        plOrbper: json["pl_orbper"] == null ? null : json["pl_orbper"].toDouble(),
        plRade: json["pl_rade"] == null ? null : json["pl_rade"].toDouble(),
        plMassj: json["pl_massj"] == null ? null : json["pl_massj"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "pl_name": plName,
        "disc_year": discYear,
        "discoverymethod": discoverymethod,
        "pl_orbper": plOrbper == null ? null : plOrbper,
        "pl_rade": plRade == null ? null : plRade,
        "pl_massj": plMassj == null ? null : plMassj,
    };
}
