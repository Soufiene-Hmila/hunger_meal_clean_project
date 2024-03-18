import 'package:equatable/equatable.dart';

class CostData extends Equatable {

  final int? restaurantId;
  final dynamic deliveryAmount;

  const CostData({
      this.restaurantId, 
      this.deliveryAmount,
  });

  factory CostData.fromJson(dynamic json) {
    return CostData(
      restaurantId: json['restaurant_id'],
      deliveryAmount: json['delivery_amount'],
    );
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurant_id'] = restaurantId;
    map['delivery_amount'] = deliveryAmount;
    return map;
  }

  @override
  List<Object?> get props => [
    restaurantId,
    deliveryAmount,
  ];

}