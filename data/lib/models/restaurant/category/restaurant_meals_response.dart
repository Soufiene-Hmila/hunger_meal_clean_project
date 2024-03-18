
import 'package:data/models/restaurant/category/restaurant_meal_model.dart';
import 'package:domain/entities/restaurant/restaurant_meal_data.dart';

class RestaurantMealsResponse {

  List<RestaurantMealData>? restaurantMeals;


  RestaurantMealsResponse({
      this.restaurantMeals,
  });

  factory RestaurantMealsResponse.fromJson(dynamic json) {
    return RestaurantMealsResponse(
        restaurantMeals: json['restaurantMeals'] != null
            ? (json['restaurantMeals'] as List).map((e) => RestaurantMealModel.fromJson(e)).toList(): null
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (restaurantMeals != null) {
      map['restaurantMeals'] = restaurantMeals?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}