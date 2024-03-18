import 'package:domain/entities/restaurant/restaurant_supplement_data.dart';
import 'package:equatable/equatable.dart';

class RestaurantMealData extends Equatable {

  final int? id;
  final int? restaurantId;
  final int? categoryId;
  final String? name;
  final int? approved;
  final String? price;
  final int? available;
  final dynamic image;
  final String? rating;
  final String? ratingTotal;
  final int? ratingNumber;
  final String? description;
  final String? state;
  final int? zoneId;
  final String? createdAt;
  final String? updatedAt;
  final dynamic maxSupplement;
  final List<RestaurantSupplementData>? supplements;

  const RestaurantMealData({
    this.id,
    this.restaurantId,
    this.categoryId,
    this.name,
    this.approved,
    this.price,
    this.available,
    this.image,
    this.rating,
    this.ratingTotal,
    this.ratingNumber,
    this.description,
    this.state,
    this.zoneId,
    this.createdAt,
    this.updatedAt,
    this.maxSupplement,
    this.supplements,
  });

  factory RestaurantMealData.fromJson(dynamic json) {
    return RestaurantMealData(
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
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      maxSupplement: json['max_supplement'],
      supplements: json['supplements'] != null ? (json['supplements'] as List).map((i) => RestaurantSupplementData.fromJson(i)).toList() : null,
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
    map['rating'] = rating;
    map['rating_total'] = ratingTotal;
    map['rating_number'] = ratingNumber;
    map['description'] = description;
    map['state'] = state;
    map['zone_id'] = zoneId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['max_supplement'] = maxSupplement;
    if (supplements != null) {
      map['supplements'] = supplements?.map((v) => v.toJson()).toList();
    }
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
    createdAt,
    updatedAt,
    maxSupplement,
    supplements,
  ];
}
