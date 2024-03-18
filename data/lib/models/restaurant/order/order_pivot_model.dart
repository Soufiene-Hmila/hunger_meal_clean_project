import 'package:domain/entities/restaurant/order_pivot_data.dart';

class OrderPivotModel extends OrderPivotData {

  const OrderPivotModel({
    int? orderId,
    int? mealId,
    int? quantity,
    dynamic supplement,
    String? createdAt,
    String? updatedAt,
  }): super(
    orderId: orderId,
    mealId: mealId,
    quantity: quantity,
    supplement: supplement,
    createdAt: createdAt,
    updatedAt: updatedAt
  );

  factory OrderPivotModel.fromJson(dynamic json) {
    return OrderPivotModel(
        orderId: json['order_id'],
        mealId: json['meal_id'],
        quantity: json['quantity'],
        supplement: json['supplement'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = orderId;
    map['meal_id'] = mealId;
    map['quantity'] = quantity;
    map['supplement'] = supplement;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
