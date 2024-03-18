
import 'package:data/models/restaurant/category/restaurant_category_model.dart';
import 'package:domain/entities/restaurant/restaurant_category_data.dart';

class RestaurantCategoriesResponse {

  List<RestaurantCategoryData>? restaurantCategories;

  RestaurantCategoriesResponse({
      this.restaurantCategories,
  });

  factory RestaurantCategoriesResponse.fromJson(dynamic json) {
    return RestaurantCategoriesResponse(
        restaurantCategories: json['restaurantCategories'] != null
            ? (json['restaurantCategories'] as List).map((e) => RestaurantCategoryModel.fromJson(e)).toList() : null
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (restaurantCategories != null) {
      map['restaurantCategories'] = restaurantCategories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}