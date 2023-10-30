import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tarea_flutter/models/productsmodel.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutterapptest-1c64c-default-rtdb.firebaseio.com';
  final List allData = [];

  bool isLoading = true;

  ProductsService() {
    this.loadProducts();
  }

  Future<List> loadProducts() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final product = Product.fromMap(value);
      this.allData.add(product);
    });

    this.isLoading = false;
    notifyListeners();

    return allData;
  }
}
