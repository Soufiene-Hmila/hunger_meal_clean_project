
import 'package:core/params/client/order/supplement_params.dart';

class MealsParams {

  final int? mealId;
  final int? quantity;
  final List<SupplementParams>? supplements;

  MealsParams({
      this.mealId, 
      this.quantity, 
      this.supplements,
  });

  factory MealsParams.fromJson(dynamic json) {
    return MealsParams(
        mealId: json['meal_id'],
        quantity: json['quantity'],
        supplements: json['supplements'] != null ? (json['supplements'] as List).map((e) =>
            SupplementParams.fromJson(e)).toList(): null
    );

  }



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meal_id'] = mealId;
    map['quantity'] = quantity;
    if (supplements != null) {
      map['supplements'] = supplements?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}