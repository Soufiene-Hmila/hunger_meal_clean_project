
import 'package:core/params/client/order/meals_params.dart';

class OrdersParams {

  final int? restaurantId;
  final double? orderAmount;
  final double? deliveryAmount;
  final List<MealsParams>? meals;

  OrdersParams({
      this.restaurantId, 
      this.orderAmount, 
      this.deliveryAmount, 
      this.meals,
  });

  factory OrdersParams.fromJson(dynamic json) {
    return OrdersParams(
        restaurantId: json['restaurant_id'],
        orderAmount: json['order_amount'],
        deliveryAmount: json['delivery_amount'],
        meals: json['meals'] != null ? (json['meals'] as List).map((e) =>
            MealsParams.fromJson(e)).toList(): null
    );

  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurant_id'] = restaurantId;
    map['order_amount'] = orderAmount;
    map['delivery_amount'] = deliveryAmount;
    if (meals != null) {
      map['meals'] = meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}