
import 'package:domain/domain.dart';

class SupplementModel extends SupplementData {

  const SupplementModel({
    int id = 0,
    String? name,
    int mealId = 0,
    dynamic price,
    int? mandatory,
    int inCart = 0,
    int? max,
  }): super(
    id: id,
    name: name,
    mealId: mealId,
    price: price,
    mandatory: mandatory,
    max: max,
    inCart: inCart
  );

  factory SupplementModel.fromJson(dynamic json) {
    return SupplementModel(
      id: json['id'],
      name: json['name'],
      mealId: json['meal_id'],
      price: json['price'],
      mandatory: json['mandatory'] != null ? int.parse('${json['mandatory']}'): 0,
      max: json['max'] != null ? int.parse('${json['max']}'): 0,
      inCart: json['in_cart'] ?? 0
    );

  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['meal_id'] = mealId;
    map['price'] = price;
    map['mandatory'] = mandatory;
    map['max'] = max;
    map['in_cart'] = inCart;
    return map;
  }


}