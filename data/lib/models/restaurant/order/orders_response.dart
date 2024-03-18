import 'package:data/models/restaurant/order/order_model.dart';
import 'package:domain/domain.dart';

class OrdersResponse {

  List<OrderData>? restaurantOrders;

  OrdersResponse({
      this.restaurantOrders,
  });

  factory OrdersResponse.fromJson(dynamic json) {
    return OrdersResponse(
      restaurantOrders: json['restaurantOrders'] != null ? (json['restaurantOrders'] as List).map((i) =>
          OrderModel.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (restaurantOrders != null) {
      map['restaurantOrders'] = restaurantOrders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}