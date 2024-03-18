import 'package:data/models/client/meals/supplement_model.dart';
import 'package:domain/domain.dart';

class MealModel extends MealData {

  const MealModel({
    int id = 0,
    int restaurantId = 0,
    int categoryId = 0,
    String? name,
    int approved = 0,
    dynamic price,
    int available = 0,
    String? image,
    dynamic rating,
    dynamic ratingTotal,
    int? ratingNumber,
    String? description,
    String? state,
    int zoneId = 0,
    int? maxSupplement,
    int quantity = 1,
    List<SupplementData>? supplements,
  }): super(
    id: id,
    restaurantId: restaurantId,
    categoryId: categoryId,
    name: name,
    approved: approved,
    available: available,
    price: price,
    image: image,
    description: description,
    state: state,
    zoneId: zoneId,
    rating: rating,
    ratingTotal: ratingTotal,
    ratingNumber: ratingNumber,
    maxSupplement: maxSupplement,
    quantity: quantity,
    supplements: supplements
  );

  factory MealModel.fromJson(dynamic json) {
    return MealModel(
      id: json['id'],
      restaurantId: json['restaurant_id'],
      categoryId: json['category_id'],
      name: json['name'],
      approved: json['approved'] != null ? int.parse('${json['approved']}') : 0,
      available: json['available'] != null ? int.parse('${json['available']}') : 0,
      price: json['price'],
      image: json['image'],
      description: json['description'],
      state: json['state'],
      zoneId: json['zone_id'],
      rating: json['rating'],
      ratingTotal: json['rating_total'],
      ratingNumber: json['rating_number'] != null ? int.tryParse('${json['rating_number']}') : 0,
      maxSupplement: json['max_supplement'] != null ? int.tryParse('${json['max_supplement']}') : 0,
      quantity: json['quantity'] ?? 1,
      supplements: json['supplements'] != null ? (json['supplements'] as List).map((i) =>
          SupplementModel.fromJson(i)).toList() : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['restaurant_id'] = restaurantId;
    map['category_id'] = categoryId;
    map['name'] = name;
    map['approved'] = approved;
    map['price'] = price;
    map['available'] = available;
    map['image'] = image;
    map['description'] = description;
    map['state'] = state;
    map['zone_id'] = zoneId;
    map['rating'] = rating;
    map['rating_total'] = ratingTotal;
    map['rating_number'] = ratingNumber;
    map['max_supplement'] = maxSupplement;
    map['quantity'] = quantity;
    return map;
  }

}