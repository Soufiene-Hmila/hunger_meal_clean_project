import 'dart:convert';

import 'package:domain/entities/client/supplement_data.dart';
import 'package:equatable/equatable.dart';

class MealData extends Equatable {

  final int id;
  final int restaurantId;
  final int categoryId;

  final String? name;
  final int approved;
  final String? price;
  final int available;
  final String? image;
  final String? rating;

  final String? ratingTotal;

  final int? ratingNumber;

  final String? description;
  final String? state;

  final int zoneId;

  final int? maxSupplement;
  final int quantity;

  final List<SupplementData>? supplements;

  const MealData({
    this.id = 0,
    this.restaurantId = 0,
    this.categoryId = 0,
    this.name,
    this.approved = 0,
    this.price,
    this.available = 0,
    this.image,
    this.rating,
    this.ratingTotal,
    this.ratingNumber,
    this.description,
    this.state,
    this.zoneId = 0,
    this.maxSupplement,
    this.quantity = 1,
    this.supplements,
  });


  factory MealData.fromJson(Map<String, dynamic> json) {
    return MealData(
      id: json['id'],
      restaurantId: json['restaurant_id'],
      categoryId: json['category_id'],
      name: json['name'],
      approved: json['approved'],
      price: json['price'],
      available: json['available'],
      image: json['image'],
      rating: json['rating'],
      ratingTotal: json['rating_total'],
      ratingNumber: json['rating_number'],
      description: json['description'],
      state: json['state'],
      zoneId: json['zone_id'],
      maxSupplement: json['max_supplement'],
      quantity: json['quantity'],
      supplements: (json['supplements'] as List<dynamic>)
          .map((supplementJson) => SupplementData.fromJson(supplementJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['restaurant_id'] = restaurantId;
    map['category_id'] = categoryId;
    map['name'] = name;
    map['approved'] = approved;
    map['price'] = price;
    map['available'] = available;
    map['image'] = image;
    map['description'] = description;
    map['state'] = state;
    map['zone_id'] = zoneId;
    map['rating'] = rating;
    map['rating_total'] = ratingTotal;
    map['rating_number'] = ratingNumber;
    map['max_supplement'] = maxSupplement;
    map['quantity'] = quantity;
    return map;
  }

  @override
  List<Object?> get props => [
    id,
    restaurantId,
    categoryId,
    name,
    approved,
    price,
    available,
    image,
    rating,
    ratingTotal,
    ratingNumber,
    description,
    state,
    zoneId,
    maxSupplement,
    quantity,
    supplements,
  ];

}
