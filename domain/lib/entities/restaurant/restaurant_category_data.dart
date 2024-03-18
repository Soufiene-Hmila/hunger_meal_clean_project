import 'package:equatable/equatable.dart';

class RestaurantCategoryData extends Equatable {

  final int? id;
  final String? name;
  final String? image;
  final String? description;

  const RestaurantCategoryData({
      this.id,
      this.name,
      this.image,
      this.description,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    return map;
  }

  @override
  List<Object?> get props => [
    id,
    name,
    image,
    description,
  ];

}