import 'package:meta/meta.dart';
import 'dart:convert';

class Shoe {
  String name;
  String price;
  String pic;
  String? decription;

  Shoe({
    required this.name,
    required this.price,
    required this.pic,
    this.decription,
  });

  factory Shoe.fromJson(String str) => Shoe.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  factory Shoe.fromMap(Map<String, dynamic> json) => Shoe(
        name: json["name"],
        price: json["price"],
        pic: json["pic"],
        decription: json["decription"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "price": price,
        "pic": pic,
        "decription": decription,
      };
}
