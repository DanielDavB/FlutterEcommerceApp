import 'package:meta/meta.dart';
import 'dart:convert';

class Product {
  String name;
  String price;
  String pic;
  String? description;

  Product({
    required this.name,
    required this.price,
    required this.pic,
    this.description,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        name: json["name"],
        price: json["price"],
        pic: json["pic"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "price": price,
        "pic": pic,
        "description": description,
      };
}
