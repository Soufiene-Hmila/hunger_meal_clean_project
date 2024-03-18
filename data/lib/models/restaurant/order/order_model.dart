
import 'package:data/models/client/meals/supplement_model.dart';
import 'package:data/models/client/restaurant/restaurant_model.dart';
import 'package:data/models/restaurant/order/order_client_model.dart';
import 'package:data/models/restaurant/order/order_driver_model.dart';
import 'package:data/models/restaurant/order/order_meal_model.dart';
import 'package:data/models/restaurant/order/order_restaurant_model.dart';
import 'package:data/models/restaurant/order/order_supplement_model.dart';
import 'package:domain/domain.dart';

class OrderModel extends OrderData {

  const OrderModel({
    int? id,
    int? clientId,
    int? driverId,
    int? restaurantId,
    String? price,
    String? shippingCost,
    String? totalPrice,
    int? now,
    int? approved,
    int? changed,
    String? reference,
    String? clientLatitude,
    String? clientLongitude,
    dynamic clientLocation,
    String? clientPhone,
    String? deliveryDate,
    int? counter,
    String? stateDriver,
    String? stateRestaurant,
    String? stateOrder,
    dynamic estimationMin,
    dynamic estimationMax,
    dynamic dateAcceptDriver,
    dynamic dateAcceptRestaurant,
    dynamic dateDelivred,
    dynamic clientComment,
    dynamic driverComment,
    dynamic restaurantComment,
    int? zoneId,
    String? createdAt,
    String? updatedAt,
    OrderClientData? client,
    OrderDriverData? driver,
    OrderRestaurantData? restaurant,
    List<OrderMealData>? meals,
  }): super(
    id: id,
    clientId: clientId,
    driverId: driverId,
    restaurantId: restaurantId,
    price: price,
    shippingCost: shippingCost,
    totalPrice: totalPrice,
    now: now,
    approved: approved,
    changed: changed,
    reference: reference,
    clientLatitude: clientLatitude,
    clientLongitude: clientLongitude,
    clientLocation: clientLocation,
    clientPhone: clientPhone,
    deliveryDate: deliveryDate,
    counter: counter,

    stateDriver: stateDriver,
    stateRestaurant: stateRestaurant,
    stateOrder: stateOrder,
    estimationMin: estimationMin,
    estimationMax: estimationMax,
    dateAcceptDriver: dateAcceptDriver,
    dateAcceptRestaurant: dateAcceptRestaurant,
    dateDelivred: dateDelivred,
    clientComment: clientComment,
    driverComment: driverComment,
    restaurantComment: restaurantComment,
    zoneId: zoneId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    client: client,
    driver: driver,
    restaurant: restaurant,
    meals: meals,
  );

  factory OrderModel.fromJson(dynamic json) {
    return OrderModel(
      id: json['id'],
      clientId: json['client_id'],
      driverId: json['driver_id'],
      restaurantId: json['restaurant_id'],
      price: json['price'],
      shippingCost: json['shipping_cost'],
      totalPrice: json['total_price'],
      now: json['now'],
      approved: json['approved'],
      changed: json['changed'],
      reference: json['reference'],
      clientLatitude: json['client_latitude'],
      clientLongitude: json['client_longitude'],
      clientLocation: json['client_location'],
      clientPhone: json['client_phone'],
      deliveryDate: json['delivery_date'],
      counter: json['counter'],
      stateDriver: json['stateDriver'],
      stateRestaurant: json['stateRestaurant'],
      stateOrder: json['stateOrder'],
      estimationMin: json['estimation_min'],
      estimationMax: json['estimation_max'],
      dateAcceptDriver: json['date_accept_driver'],
      dateAcceptRestaurant: json['date_accept_restaurant'],
      dateDelivred: json['date_delivred'],
      clientComment: json['client_comment'],
      driverComment: json['driver_comment'],
      restaurantComment: json['restaurant_comment'],
      zoneId: json['zone_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      client: json['client'] != null ? OrderClientModel.fromJson(json['client']) : null,
      driver: json['driver'] != null ? OrderDriverModel.fromJson(json['driver']) : null,
      restaurant: json['restaurant'] != null ? OrderRestaurantModel.fromJson(json['restaurant']) : null,
      meals: json['meals'] != null ? (json['meals'] as List).map((i) => OrderMealModel.fromJson(i)).toList() : null,
    );
  }

  @override
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
