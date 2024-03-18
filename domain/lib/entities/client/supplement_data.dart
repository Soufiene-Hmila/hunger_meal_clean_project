import 'package:equatable/equatable.dart';

class SupplementData extends Equatable {

  final int id;
  final String? name;
  final int mealId;
  final String? price;
  final int? mandatory;
  final int inCart;
  final int? max;

  const SupplementData({
    this.id = 0,
    this.name,
    this.mealId = 0,
    this.price,
    this.mandatory,
    this.inCart = 0,
    this.max = 0,
  });

  factory SupplementData.fromJson(Map<String, dynamic> json) {
    return SupplementData(
      id: json['id'],
      name: json['name'],
      mealId: json['meal_id'],
      price: json['price'],
      mandatory: json['mandatory'],
      inCart: json['in_cart'],
      max: json['max'],
    );
  }

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

  @override
  List<Object?> get props => [
    id,
    name,
    mealId,
    price,
    mandatory,
    max,
    inCart,
  ];
}
