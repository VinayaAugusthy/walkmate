import 'package:hive/hive.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  int price;
  @HiveField(4)
  double discountPercentage;
  @HiveField(5)
  double rating;
  @HiveField(6)
  final int stock;
  @HiveField(7)
  final String brand;
  @HiveField(8)
  final List<String> images;
  CartModel({
    required this.id,
    required this.brand,
    required this.title,
    required this.price,
    required this.discountPercentage,
    required this.description,
    required this.rating,
    required this.stock,
    required this.images,
  });
}
