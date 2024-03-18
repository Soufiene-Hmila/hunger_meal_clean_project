

import 'package:data/models/client/categories/category_model.dart';
import 'package:data/models/client/meals/meal_model.dart';
import 'package:data/models/client/restaurant/restaurant_model.dart';
import 'package:domain/domain.dart';

class RestaurantResponse {

  RestaurantData? restaurant;

  RestaurantResponse({
    this.restaurant,
  });

  factory RestaurantResponse.fromJson(dynamic json) {
    return RestaurantResponse(
      restaurant: json['restaurants'] != null ? RestaurantModel.fromJson(json['restaurants']) : null,
    );
  }

}