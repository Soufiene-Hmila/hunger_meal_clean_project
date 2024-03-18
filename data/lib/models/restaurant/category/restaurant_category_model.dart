
import 'package:domain/entities/restaurant/restaurant_category_data.dart';

class RestaurantCategoryModel extends RestaurantCategoryData {

  const RestaurantCategoryModel({
    int? id,
    String? name,
    String? image,
    String? description,
  }): super(
    id: id,
    name: name,
    image: image,
    description: description
  );

  factory RestaurantCategoryModel.fromJson(dynamic json) {
    return RestaurantCategoryModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        description: json['description'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    return map;
  }

}