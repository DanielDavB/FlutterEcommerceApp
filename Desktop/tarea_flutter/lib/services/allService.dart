import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tarea_flutter/models/productsmodel.dart';
import 'package:http/http.dart' as http;

class ShoesService extends ChangeNotifier {
  final String _baseUrl = 'flutterapptest-1c64c-default-rtdb.firebaseio.com';
  final List allData = [];

  bool isLoading = true;

  ShoesService() {
    this.loadShoes();
  }

  Future<List> loadShoes() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'shoes.json');
    final resp = await http.get(url);

    final Map<String, dynamic> shoesMap = json.decode(resp.body);

    shoesMap.forEach((key, value) {
      final shu = Shoe.fromMap(value);
      this.allData.add(shu);
    });

    this.isLoading = false;
    notifyListeners();

    return allData;
  }
}
