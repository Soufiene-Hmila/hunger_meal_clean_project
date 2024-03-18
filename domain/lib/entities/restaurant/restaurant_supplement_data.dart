import 'package:equatable/equatable.dart';

class RestaurantSupplementData extends Equatable {

  final int? id;
  final String? name;
  final int? mealId;
  final String? price;
  final int? mandatory;
  final dynamic max;
  final dynamic createdAt;
  final dynamic updatedAt;

  const RestaurantSupplementData({
    this.id,
    this.name,
    this.mealId,
    this.price,
    this.mandatory,
    this.max,
    this.createdAt,
    this.updatedAt,
  });

  factory RestaurantSupplementData.fromJson(dynamic json) {
    return RestaurantSupplementData(
      id: json['id'],
      name: json['name'],
      mealId: json['meal_id'],
      price: json['price'],
      mandatory: json['mandatory'],
      max: json['max'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['meal_id'] = mealId;
    map['price'] = price;
    map['mandatory'] = mandatory;
    map['max'] = max;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

  @override
  List<Object?> get props => [
    id,
    name,
    mealId,
    price,
    mandatory,
    max,
    createdAt,
    updatedAt,
  ];
}
