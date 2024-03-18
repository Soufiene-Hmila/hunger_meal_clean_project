import 'package:domain/entities/restaurant/order_pivot_data.dart';
import 'package:domain/entities/restaurant/order_supplement_data.dart';
import 'package:equatable/equatable.dart';

class OrderMealData extends Equatable {

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
  final OrderPivotData? pivot;
  final List<OrderSupplementData>? orderSupplements;

  const OrderMealData({
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
    this.pivot,
    this.orderSupplements
  });

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
    pivot,
    orderSupplements
  ];

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
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }

}
