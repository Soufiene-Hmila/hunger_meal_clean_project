import 'package:domain/domain.dart';

class OrderSupplementModel extends OrderSupplementData {

  const OrderSupplementModel({
    String? name,
    String? price
  }): super(
    name: name,
    price: price
  );

  factory OrderSupplementModel.fromJson(dynamic json) {
    return OrderSupplementModel(
        name: json['name'],
        price: json['price']);
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['price'] = price;
    return map;
  }
}
