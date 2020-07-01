import 'dart:convert';

import 'package:amiibo/models/release_date.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String api_url = "https://www.amiiboapi.com/api/amiibo/";

class AmiiboList extends ChangeNotifier {
  String lastUpdate;
  List<Amiibo> amiibo = [];

  AmiiboList();

  void rebuild() {
    notifyListeners();
  }

  void add(Amiibo am) {
    amiibo.add(am);
  }

  void loadAll() async {
    http.Response response = await http.get(api_url);
    if (response.statusCode != 200) {
      //TODO ERROR MANAGEMENT
      print("error");
      return;
    }
    Map<dynamic, dynamic> json = jsonDecode(response.body);
    List<dynamic> amiibos = json['amiibo'];
    print("length: ${amiibos.length}");
    for (int i = 0; i < amiibos.length; i++) {
      add(Amiibo.fromJson(amiibos[i]));
    }
    notifyListeners();
  }

}

class Amiibo {
  String head;
  String tail;
  String character;
  String name;
  String gameSeries;
  String amiiboSeries;
  List<ReleaseDate> releaseDates = [];
  String type;
  Image image = Image.network("");

  Amiibo(
      this.amiiboSeries,
      this.character,
      this.gameSeries,
      this.head,
      this.image,
      this.name,
      this.releaseDates,
      this.tail,
      this.type);

  factory Amiibo.fromJson(Map<dynamic, dynamic> json) {
    return Amiibo(
        json['amiiboSeries'],
        json['character'],
        json['gameSeries'],
        json['head'],
        Image.network(json['image']),
        json['name'],
        ReleaseDate.arrayFromJson(json['release']),
        json['tail'],
        json['type']);
  }
}