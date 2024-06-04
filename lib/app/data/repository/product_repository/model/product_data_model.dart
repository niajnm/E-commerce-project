import 'dart:convert';

class ProductDataModel {
  final int id;
  final String name;
  final String permalink;
  final String price;
  final String description;
  final String imageUrl;
  final double rating;
  final int totalRatings;

  ProductDataModel({
    required this.id,
    required this.name,
    required this.permalink,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.totalRatings,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    // Extract the first image URL if available
    String imageUrl = "";
    if (json['images'] != null && json['images'].isNotEmpty) {
      imageUrl = json['images'][0]['src'];
    }

    return ProductDataModel(
      id: json['id'],
      name: json['name'],
      permalink: json['permalink'],
      price: json['price'].toString(),
      description: json['short_description'],
      imageUrl: imageUrl,
      rating: json['average_rating'] != null ? double.parse(json['average_rating']) : 0.0,
      totalRatings: json['rating_count'] != null ? json['rating_count'] : 0,
    );
  }
}
