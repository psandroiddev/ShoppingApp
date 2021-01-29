import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final int price;

  Product({this.id, this.name, this.price});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'price': price,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price}';
  }
}