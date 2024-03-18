import 'package:equatable/equatable.dart';

class RestaurantsParams extends Equatable {

  final int? restaurantId;

  const RestaurantsParams({
      this.restaurantId,
  });

  factory RestaurantsParams.fromJson(dynamic json) {
    return RestaurantsParams(
      restaurantId: json['restaurant_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurant_id'] = restaurantId;
    return map;
  }

  @override
  List<Object?> get props => [
    restaurantId
  ];

}