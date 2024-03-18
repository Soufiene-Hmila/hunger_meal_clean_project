import 'package:data/models/client/meals/meal_model.dart';
import 'package:domain/domain.dart';

class CategoryModel extends CategoryData {

  const CategoryModel({
    int? id,
    String? name,
    String? image,
    String? description,
    String? state,
    int? zoneId,
    List<MealData>? meals
  }): super(
    id: id,
    name: name,
    image: image,
    description: description,
    state: state,
    zoneId: zoneId,
    meals: meals
  );

  factory CategoryModel.fromJson(dynamic json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      state: json['state'],
      zoneId: json['zone_id'],
      meals: json['meals'] != null ? (json['meals'] as List).map((i) => MealModel.fromJson(i)).toList() : null,
    );

  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    map['state'] = state;
    map['zone_id'] = zoneId;
    return map;
  }



}