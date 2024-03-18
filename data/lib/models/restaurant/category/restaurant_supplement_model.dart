import 'package:domain/domain.dart';

class RestaurantSupplementModel extends RestaurantSupplementData {

  const RestaurantSupplementModel({
    int? id,
    String? name,
    int? mealId,
    String? price,
    int? mandatory,
    dynamic max,
  }): super(
    id: id,
    name: name,
    mealId: mealId,
    price: price,
    max: max,
    mandatory: mandatory
  );

  factory RestaurantSupplementModel.fromJson(dynamic json) {
    return RestaurantSupplementModel(
      id: json['id'],
      name: json['name'],
      mealId: json['meal_id'],
      price: json['price'],
      mandatory: json['mandatory'],
      max: json['max'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['meal_id'] = mealId;
    map['price'] = price;
    map['mandatory'] = mandatory;
    map['max'] = max;
    return map;
  }
}
