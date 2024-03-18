import 'package:data/models/client/categories/category_model.dart';
import 'package:data/models/client/meals/meal_model.dart';
import 'package:domain/domain.dart';

class RestaurantModel extends RestaurantData {

  const RestaurantModel({
    int? id,
    int? userId,
    String? username,
    dynamic firstname,
    dynamic lastname,
    String? email,
    dynamic emailVerifiedAt,
    int? roleId,
    String? address,
    String? city,
    dynamic about,
    dynamic registrationNumber,
    String? image,
    String? phone,
    String? description,
    String? state,
    int? available,
    int? zoneId,
    String? latitude,
    String? longitude,
    String? rating,
    List<CategoryData>? categories
  }): super(
    id: id,
    userId: userId,
    username: username,
    firstname: firstname,
    lastname: lastname,
    email: email,
    emailVerifiedAt: emailVerifiedAt,
    roleId: roleId,
    address: address,
    city: city,
    about: about,
    registrationNumber: registrationNumber,
    image: image,
    phone: phone,
    description: description,
    state: state,
    zoneId: zoneId,
    latitude: latitude,
    longitude: longitude,
    rating: rating,
    categories: categories
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['username'] = username;
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['role_id'] = roleId;
    map['address'] = address;
    map['city'] = city;
    map['about'] = about;
    map['registration_number'] = registrationNumber;
    map['image'] = image;
    map['phone'] = phone;
    map['description'] = description;
    map['state'] = state;
    map['available'] = available;
    map['zone_id'] = zoneId;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['rating'] = rating;
    return map;
  }

  factory RestaurantModel.fromJson(dynamic json) {
    return RestaurantModel(
      id: json['id'],
      userId: json['user_id'],
      username: json['username'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      roleId: json['role_id'],
      address: json['address'],
      city: json['city'],
      about: json['about'],
      registrationNumber: json['registration_number'],
      image: json['image'],
      phone: json['phone'],
      description: json['description'],
      state: json['state'],
      available: json['available'],
      zoneId: json['zone_id'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      rating: json['rating'],
      categories: json['restaurantCategory'] != null ? (json['restaurantCategory'] as List).map((i) => CategoryModel.fromJson(i)).toList() : null,
    );
  }

}