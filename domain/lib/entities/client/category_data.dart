import 'package:domain/entities/client/meal_data.dart';
import 'package:equatable/equatable.dart';

class CategoryData extends Equatable {

  final int? id;
  final String? name;
  final String? image;
  final String? description;
  final String? state;
  final int? zoneId;
  final List<MealData>? meals;

  const CategoryData({
      this.id, 
      this.name, 
      this.image, 
      this.description, 
      this.state, 
      this.zoneId,
      this.meals
  });

  @override
  List<Object?> get props => [
    id,
    name,
    image,
    description,
    state,
    zoneId,
    meals
  ];

  // CategoryData.fromJson(dynamic json) {
  //   id = json['id'];
  //   name = json['name'];
  //   image = json['image'];
  //   description = json['description'];
  //   state = json['state'];
  //   zoneId = json['zone_id'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['id'] = id;
  //   map['name'] = name;
  //   map['image'] = image;
  //   map['description'] = description;
  //   map['state'] = state;
  //   map['zone_id'] = zoneId;
  //   return map;
  // }
  //


}