import 'package:data/models/restaurant/order/order_pivot_model.dart';
import 'package:data/models/restaurant/order/order_supplement_model.dart';
import 'package:domain/domain.dart';

class OrderMealModel extends OrderMealData {

  const OrderMealModel({
    int? id,
    int? restaurantId,
    int? categoryId,
    String? name,
    int? approved,
    String? price,
    int? available,
    dynamic image,
    String? rating,
    String? ratingTotal,
    int? ratingNumber,
    String? description,
    String? state,
    int? zoneId,
    dynamic maxSupplement,
    List<OrderSupplementData>? orderSupplements,
    OrderPivotData? pivot,
  }): super(
    id: id,
    restaurantId: restaurantId,
    categoryId: categoryId,
    name: name,
    approved: approved,
    price: price,
    available: available,
    image: image,
    rating: rating,
    ratingTotal: ratingTotal,
    ratingNumber: ratingNumber,
    description: description,
    state: state,
    zoneId: zoneId,
    maxSupplement: maxSupplement,
    orderSupplements: orderSupplements,
    pivot: pivot
  );

  factory OrderMealModel.fromJson(dynamic json) {
    return OrderMealModel(
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
        pivot: json['pivot'] != null ? OrderPivotModel.fromJson(json['pivot']) : null,
        orderSupplements: json['supplements'] != null ? (json['supplements'] as List).map((i) => OrderSupplementModel.fromJson(i)).toList() : null,

    );
  }

  @override
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
    map['max_supplement'] = maxSupplement;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }
}
