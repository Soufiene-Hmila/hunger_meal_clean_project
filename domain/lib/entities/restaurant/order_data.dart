import 'package:domain/entities/restaurant/order_restaurant_data.dart';
import 'package:domain/entities/restaurant/order_client_data.dart';
import 'package:domain/entities/restaurant/order_driver_data.dart';
import 'package:domain/entities/restaurant/order_meal_data.dart';
import 'package:domain/entities/restaurant/order_supplement_data.dart';
import 'package:equatable/equatable.dart';

class OrderData extends Equatable {

  final int? id;
  final int? clientId;
  final int? driverId;
  final int? restaurantId;
  final String? price;
  final String? shippingCost;
  final String? totalPrice;
  final int? now;
  final int? approved;
  final int? changed;
  final String? reference;
  final String? clientLatitude;
  final String? clientLongitude;
  final dynamic clientLocation;
  final String? clientPhone;
  final String? deliveryDate;
  final int? counter;
  final String? stateDriver;
  final String? stateRestaurant;
  final String? stateOrder;
  final dynamic estimationMin;
  final dynamic estimationMax;
  final dynamic dateAcceptDriver;
  final dynamic dateAcceptRestaurant;
  final dynamic dateDelivred;
  final dynamic clientComment;
  final dynamic driverComment;
  final dynamic restaurantComment;
  final int? zoneId;
  final String? createdAt;
  final String? updatedAt;
  final OrderClientData? client;
  final OrderDriverData? driver;
  final OrderRestaurantData? restaurant;
  final List<OrderMealData>? meals;

  const OrderData({
    this.id,
    this.clientId,
    this.driverId,
    this.restaurantId,
    this.price,
    this.shippingCost,
    this.totalPrice,
    this.now,
    this.approved,
    this.changed,
    this.reference,
    this.clientLatitude,
    this.clientLongitude,
    this.clientLocation,
    this.clientPhone,
    this.deliveryDate,
    this.counter,
    this.stateDriver,
    this.stateRestaurant,
    this.stateOrder,
    this.estimationMin,
    this.estimationMax,
    this.dateAcceptDriver,
    this.dateAcceptRestaurant,
    this.dateDelivred,
    this.clientComment,
    this.driverComment,
    this.restaurantComment,
    this.zoneId,
    this.createdAt,
    this.updatedAt,
    this.client,
    this.driver,
    this.restaurant,
    this.meals,
  });

  @override
  List<Object?> get props => [
    id,
    clientId,
    driverId,
    restaurantId,
    price,
    shippingCost,
    totalPrice,
    now,
    approved,
    changed,
    reference,
    clientLatitude,
    clientLongitude,
    clientLocation,
    clientPhone,
    deliveryDate,
    counter,
    stateDriver,
    stateRestaurant,
    stateOrder,
    estimationMin,
    estimationMax,
    dateAcceptDriver,
    dateAcceptRestaurant,
    dateDelivred,
    clientComment,
    driverComment,
    restaurantComment,
    zoneId,
    createdAt,
    updatedAt,
    client,
    driver,
    restaurant,
    meals,
  ];


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['client_id'] = clientId;
    map['driver_id'] = driverId;
    map['restaurant_id'] = restaurantId;
    map['price'] = price;
    map['shipping_cost'] = shippingCost;
    map['total_price'] = totalPrice;
    map['now'] = now;
    map['approved'] = approved;
    map['changed'] = changed;
    map['reference'] = reference;
    map['client_latitude'] = clientLatitude;
    map['client_longitude'] = clientLongitude;
    map['client_location'] = clientLocation;
    map['client_phone'] = clientPhone;
    map['delivery_date'] = deliveryDate;
    map['counter'] = counter;
    map['stateDriver'] = stateDriver;
    map['stateRestaurant'] = stateRestaurant;
    map['stateOrder'] = stateOrder;
    map['estimation_min'] = estimationMin;
    map['estimation_max'] = estimationMax;
    map['date_accept_driver'] = dateAcceptDriver;
    map['date_accept_restaurant'] = dateAcceptRestaurant;
    map['date_delivred'] = dateDelivred;
    map['client_comment'] = clientComment;
    map['driver_comment'] = driverComment;
    map['restaurant_comment'] = restaurantComment;
    map['zone_id'] = zoneId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (client != null) {
      map['client'] = client?.toJson();
    }
    if (driver != null) {
      map['driver'] = driver?.toJson();
    }
    if (restaurant != null) {
      map['restaurant'] = restaurant?.toJson();
    }
    if (meals != null) {
      map['meals'] = meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
