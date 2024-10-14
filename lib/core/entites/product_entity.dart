import 'package:fruits_app/core/entites/review_entity.dart';

class ProductEntity {
  final String name;
  final String price;
  final String code;
  final String description;
  final bool isFeatured;
  String? imageUrl;
  bool? isOrganic = false;
  final int expiryMonths;
  num avgRating = 0;
  int sellCount = 0;
  num ratingCount = 0;
  final int calories;
  final int amountUnit;
  final List<ReviewEntity> reviews;

  ProductEntity(
      {required this.name,
      required this.price,
      required this.code,
      required this.description,
      required this.isFeatured,
      required this.expiryMonths,
      required this.avgRating,
      required this.ratingCount,
      required this.calories,
      required this.amountUnit,
      required this.reviews,
      required this.sellCount,
      this.imageUrl,
      this.isOrganic});

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      name: json['name'],
      price: json['price'],
      code: json['code'],
      description: json['description'],
      isFeatured: json['isFeatured'],
      expiryMonths: json['expiryMonths'],
      avgRating: json['avgRating'],
      ratingCount: json['ratingCount'],
      calories: json['calories'],
      amountUnit: json['amountUnit'],
      reviews: List.from(json['reviews'])
          .map((e) => ReviewEntity.fromJson(e))
          .toList(),
      sellCount: json['sellCount'],
      imageUrl: json['imageUrl'],
      isOrganic: json['isOrganic'],
    );
  }
}
