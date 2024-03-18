import 'package:domain/domain.dart';
import 'package:domain/entities/client/meal_data.dart';
import 'package:equatable/equatable.dart';

class RestaurantData extends Equatable {

  final int? id;
  final int? userId;
  final String? username;
  final dynamic firstname;
  final dynamic lastname;
  final String? email;
  final dynamic emailVerifiedAt;
  final int? roleId;
  final String? address;
  final String? city;
  final dynamic about;
  final dynamic registrationNumber;
  final String? image;
  final String? phone;
  final String? description;
  final String? state;
  final int? available;
  final int? zoneId;
  final String? latitude;
  final String? longitude;
  final String? rating;
  final List<CategoryData>? categories;

  const RestaurantData({
      this.id,
      this.userId,
      this.username, 
      this.firstname, 
      this.lastname, 
      this.email, 
      this.emailVerifiedAt, 
      this.roleId, 
      this.address, 
      this.city, 
      this.about, 
      this.registrationNumber, 
      this.image, 
      this.phone, 
      this.description, 
      this.state, 
      this.available, 
      this.zoneId, 
      this.latitude, 
      this.longitude,
      this.rating,
      this.categories
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    username,
    firstname,
    lastname,
    email,
    emailVerifiedAt,
    roleId,
    address,
    city,
    about,
    registrationNumber,
    image,
    phone,
    description,
    state,
    available,
    zoneId,
    latitude,
    longitude,
    rating,
    categories
  ];

}