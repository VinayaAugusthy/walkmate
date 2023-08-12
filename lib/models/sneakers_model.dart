// To parse this JSON data, do
//
//     final maleSneakers = maleSneakersFromJson(jsonString);

import 'dart:convert';

MaleSneakers maleSneakersFromJson(String str) =>
    MaleSneakers.fromJson(json.decode(str));

class MaleSneakers {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  MaleSneakers({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory MaleSneakers.fromJson(Map<String, dynamic> json) => MaleSneakers(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );
}

class Product {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
      );
  static List<Product> maleSneakersFromJson(List<dynamic> maleSneaker) {
    return maleSneaker.map((json) => Product.fromJson(json)).toList();
  }
}
