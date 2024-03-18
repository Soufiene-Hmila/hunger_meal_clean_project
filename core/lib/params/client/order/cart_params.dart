
import 'package:core/params/client/order/client_params.dart';
import 'package:core/params/client/order/orders_params.dart';

class CartParams {

  final ClientParams? client;
  final List<OrdersParams>? orders;

  CartParams({
      this.client, 
      this.orders,
  });

  factory CartParams.fromJson(dynamic json) {
    return CartParams(
        client: json['client'] != null ? ClientParams.fromJson(json['client']) : null,
      orders: json['orders'] != null ? (json['orders'] as List).map((e) => OrdersParams.fromJson(e)).toList(): null
    );
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (client != null) {
      map['client'] = client?.toJson();
    }
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}