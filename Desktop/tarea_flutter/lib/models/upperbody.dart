import 'package:meta/meta.dart';
import 'dart:convert';

class Upperbody {
    String name;
    String price;
    String pic;
    String? description;

    Upperbody({
        required this.name,
        required this.price,
        required this.pic,
        this.description,
    });

    factory Upperbody.fromJson(String str) => Upperbody.fromMap(json.decode(str));

    String toRawJson() => json.encode(toMap());

    factory Upperbody.fromMap(Map<String, dynamic> json) => Upperbody(
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
