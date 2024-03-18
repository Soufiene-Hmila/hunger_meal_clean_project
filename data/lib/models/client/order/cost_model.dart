import 'package:domain/domain.dart';

class CostModel extends CostData {

  const CostModel({
    int? restaurantId,
    dynamic deliveryAmount,
  }): super(
    restaurantId: restaurantId,
    deliveryAmount: deliveryAmount
  );

  factory CostModel.fromJson(dynamic json) {
    return CostModel(
      restaurantId: json['restaurant_id'],
      deliveryAmount: json['delivery_amount'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurant_id'] = restaurantId;
    map['delivery_amount'] = deliveryAmount;
    return map;
  }


}