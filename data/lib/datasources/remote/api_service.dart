import 'package:core/core.dart';
import 'package:data/models/client/authorization/client_default_response.dart';
import 'package:data/models/client/authorization/login_model.dart';
import 'package:data/models/client/categories/categories_response.dart';
import 'package:data/models/client/categories/category_response.dart';
import 'package:data/models/client/categories/category_model.dart';
import 'package:data/models/client/meals/meal_model.dart';
import 'package:data/models/client/meals/meal_response.dart';
import 'package:data/models/client/meals/meals_response.dart';
import 'package:data/models/client/order/cost_model.dart';
import 'package:data/models/client/restaurant/restaurant_response.dart';
import 'package:data/models/client/restaurant/restaurants_response.dart';
import 'package:data/models/client/restaurant/restaurant_model.dart';
import 'package:data/models/client/user/profile_model.dart';
import 'package:data/models/client/authorization/verification_model.dart';
import 'package:data/models/client/authorization/zone_address_model.dart';
import 'package:data/models/driver/model/driver_default_response.dart';
import 'package:data/models/restaurant/category/restaurant_categories_response.dart';
import 'package:data/models/restaurant/category/restaurant_meals_response.dart';
import 'package:data/models/restaurant/model/restaurant_default_response.dart';
import 'package:data/models/restaurant/order/order_model.dart';
import 'package:data/models/restaurant/order/orders_response.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constant.kBaseUrl,)
abstract class ApiService {

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  /// Client Api Service

  @POST('/api/mobile/login-register')
  Future<HttpResponse<LoginModel>> setPhoneService({
    @Body() PhoneParams? params
  });

  @POST('/api/mobile/reset-verification')
  Future<HttpResponse<LoginModel>> setResetVerificationService({
    @Body() PhoneParams? params
  });

  @POST('/api/mobile/verify-number')
  Future<HttpResponse<VerificationModel>> setVerificationService({
    @Body() VerificationParams? params
  });

  @POST('/api/mobile/{id}/add-information')
  Future<HttpResponse<ClientDefaultResponse>> setInfoService({
    @Path() int? id,
    @Body() InfoParams? params
  });

  @GET('/api/v1/users/{params}')
  Future<HttpResponse<ProfileModel>> getProfileService({
    @Path() int? params
  });

  @GET('/api/mobile/zones')
  Future<HttpResponse<List<ZoneAddressModel>?>> getZonesService();

  @GET('/api/v1/restaurants')
  Future<HttpResponse<RestaurantsResponse>> getRestaurantsService();

  @GET('/api/v1/restaurants/{params}')
  Future<HttpResponse<RestaurantResponse>> getRestaurantService({
    @Path() int? params
  });

  @POST('/api/v1/orders/shipping-cost')
  Future<HttpResponse<List<CostModel>?>> getCostsService({
    @Body() CostParams? params
  });

  @POST('/api/v1/orders')
  Future<HttpResponse<OrderModel?>> setCartOrdersService({
    @Body() CartParams? params
  });

  @GET('/api/v1/categories')
  Future<HttpResponse<CategoriesResponse>> getCategoriesService();

  @GET('/api/v1/categories/{params}')
  Future<HttpResponse<CategoryResponse>> getCategoryService({
    @Path() int? params
  });

  @GET('/api/v1/meals')
  Future<HttpResponse<MealsResponse>> getMealsService();

  @GET('/api/v1/meals/{params}')
  Future<HttpResponse<MealResponse>> getMealService({
    @Path() int? params
  });

  /// Restaurant Api Service

  @GET('/api/v1/orders/{params}')
  Future<HttpResponse<OrderModel>> getRestaurantOrderService({
    @Path() int? params
  });

  @GET('/api/v1/restaurants/orders-accept/{params}')
  Future<HttpResponse<OrdersResponse>> getRestaurantOrdersAcceptService({
    @Path() int? params
  });

  @GET('/api/v1/restaurants/orders-waiting/{params}')
  Future<HttpResponse<OrdersResponse>> getRestaurantOrdersWaitingService({
    @Path() int? params
  });

  @GET('/api/v1/restaurants/orders-taken/{params}')
  Future<HttpResponse<OrdersResponse>> getRestaurantOrdersDeliveredService({
    @Path() int? params
  });

  @GET('/api/v1/restaurants/orders-reject/{params}')
  Future<HttpResponse<OrdersResponse>> getRestaurantOrdersRejectedService({
    @Path() int? params
  });

  @POST('/api/v1/orders/accept-restaurant/{params}')
  Future<HttpResponse<RestaurantDefaultResponse>> acceptOrderService({
    @Path() int? params
  });

  @POST('/api/v1/orders/reject-restaurant/{params}')
  Future<HttpResponse<RestaurantDefaultResponse>> rejectOrderService({
    @Path() int? params
  });

  @POST('/api/v1/orders/inprogress-restaurant/{params}')
  Future<HttpResponse<RestaurantDefaultResponse>> progressOrderService({
    @Path() int? params
  });

  @POST('/api/v1/orders/taken-restaurant/{params}')
  Future<HttpResponse<RestaurantDefaultResponse>> takenOrderService({
    @Path() int? params
  });

  @GET('/api/v1/restaurants/restaurant-categories/{params}')
  Future<HttpResponse<RestaurantCategoriesResponse>> getRestaurantCategoriesService({
    @Path() int? params
  });

  @GET('/api/v1/restaurants/{id}/restaurant-meals/{params}')
  Future<HttpResponse<RestaurantMealsResponse>> getRestaurantMealsService({
    @Path() int? id,
    @Path() int? params
  });

  @POST('/api/v1/restaurants/{id}/state-meal')
  Future<HttpResponse<RestaurantDefaultResponse>> changeRestaurantMealStateService({
    @Path() int? id,
    @Body() StateParams? params
  });

  /// Driver Api Service

  @GET('/api/v1/orders/{params}')
  Future<HttpResponse<OrderModel>> getDriverOrderService({
    @Path() int? params
  });

  @GET('/api/v1/restaurants/orders-accept/{params}')
  Future<HttpResponse<OrdersResponse>> getDriverOrdersAcceptService({
    @Path() int? params
  });

  @GET('/api/v1/drivers/orders-waiting/{params}')
  Future<HttpResponse<OrdersResponse>> getDriverOrdersWaitingService({
    @Path() int? params
  });

  @GET('/api/v1/drivers/orders-delivered/{params}')
  Future<HttpResponse<OrdersResponse>> getDriverOrdersDeliveredService({
    @Path() int? params
  });

  @GET('/api/v1/drivers/orders-reject/{params}')
  Future<HttpResponse<OrdersResponse>> getDriverOrdersRejectedService({
    @Path() int? params
  });

  @POST('/api/v1/orders/accept-driver/{params}')
  Future<HttpResponse<DriverDefaultResponse>> acceptDriverOrderService({
    @Path() int? params
  });

  @POST('/api/v1/orders/reject-driver/{params}')
  Future<HttpResponse<DriverDefaultResponse>> rejectDriverOrderService({
    @Path() int? params
  });

  @POST('/api/v1/orders/delivered-driver/{params}')
  Future<HttpResponse<DriverDefaultResponse>> deliveredDriverOrderService({
    @Path() int? params
  });

}
