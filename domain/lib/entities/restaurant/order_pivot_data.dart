import 'package:equatable/equatable.dart';

class OrderPivotData extends Equatable {

  final int? orderId;
  final int? mealId;
  final int? quantity;
  final dynamic supplement;
  final String? createdAt;
  final String? updatedAt;

  const OrderPivotData({
    this.orderId,
    this.mealId,
    this.quantity,
    this.supplement,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
    orderId,
    mealId,
    quantity,
    supplement,
    createdAt,
    updatedAt,
  ];

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
