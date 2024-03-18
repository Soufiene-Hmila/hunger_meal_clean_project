import 'package:equatable/equatable.dart';

class OrderSupplementData extends Equatable {

  final String? name;
  final String? price;

  const OrderSupplementData({
    this.name,
    this.price,
  });

  @override
  List<Object?> get props => [
    name,
    price,
  ];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['price'] = price;
    return map;
  }

}
