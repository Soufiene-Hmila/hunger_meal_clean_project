import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:core/params/client/cost/client_location_params.dart';
import 'package:core/params/client/cost/restaurants_params.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/config/utils/utils.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home/page/cart/bloc/bloc_cart.dart';
import 'package:hunger_meal/screen/screen_home/page/cart/widget/item_list_cart_order.dart';
import 'package:hunger_meal/src/map/open_street_map_search_and_pick.dart';
import 'package:hunger_meal/widget/default_action_button.dart';
import 'package:latlong2/latlong.dart';
import 'package:phone_number_text_field/phone_number_text_field.dart';
@RoutePage()
class CartTabPage extends StatefulWidget {
  const CartTabPage({super.key});

  @override
  State<CartTabPage> createState() => _CartTabPageState();
}

class _CartTabPageState extends State<CartTabPage> {


  ValueNotifier<PickedData?> deliveryPickedData = ValueNotifier<PickedData?>(null);


  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    ).then((Position position) {
      placemarkFromCoordinates(
          position.latitude, position.longitude
      ).then((List<Placemark> placeMarks) {
        deliveryPickedData.value = PickedData(
            LatLong(
                position.latitude,
                position.longitude
            ),
            "${placeMarks.last.name}"
          );
      });
    });
  }

  GlobalKey<FormState> formFieldNumberKey = GlobalKey<FormState>();
  TextEditingController phoneNumberTextEditingController = TextEditingController();

  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'TN');

  UserData? userData;

  String? deliveryPhone;

  @override
  void initState() {
    userData = injector<LocalStorageService>().userData;
    deliveryPhone = "${userData?.phone}";
    _getCurrentPosition();
    super.initState();
  }

  double calculateTotalPrice(List<MealData>? meals) {
    double total = 0.0;
    meals?.forEach((meal) {
      total += double.parse("${meal.price}") * meal.quantity;
      meal.supplements?.forEach((supplement) {
        if(supplement.inCart == 1) {
          total += double.parse("${supplement.price}");
        }
      });
    });
    return double.parse(total.toStringAsFixed(2));
  }

  ValueNotifier<List<CostData>?> deliveryPrice = ValueNotifier<List<CostData>?>([]);

  double calculateDeliveryPrice(List<CostData>? costs) {
    double total = 0.0;
    costs?.forEach((cost) {
      total += double.parse("${cost.deliveryAmount}");
    });
    return double.parse(total.toStringAsFixed(2));
  }

  CartParams getCartParams(List<MealData>? listMealData, List<CostData>? costs){
    return CartParams(
        client: ClientParams(
            clientId: userData?.id,
            clientLocation: LocationParams(
                latitude: deliveryPickedData.value?.latLong.latitude,
                longitude: deliveryPickedData.value?.latLong.longitude,
                address: deliveryPickedData.value?.address
            )
        ),
        orders: costs?.map((cost) {
          return OrdersParams(
              restaurantId: cost.restaurantId,
              deliveryAmount: double.parse("${cost.deliveryAmount}"),
              orderAmount: calculateTotalPrice(listMealData?.takeWhile((value) => value.restaurantId == cost.restaurantId).toList()),
              meals: listMealData?.takeWhile((value) => value.restaurantId == cost.restaurantId).toList().map((meal) {
                return MealsParams(
                    mealId: meal.id,
                    quantity: meal.quantity,
                    supplements: meal.supplements?.takeWhile((value) => value.inCart == 1)
                        .map((supplement) => SupplementParams(id: supplement.id)).toList()
                );
              }).toList()
          );
        }).toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill,
            image: AssetImage("assets/background.png"), opacity: 0.56
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const AutoSizeText('My Order',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        body: StreamBuilder<List<MealData>?>(
            stream: injector<BlocCart>().getAllMealService(),
            builder: (context, snapshot) {
              if(snapshot.data?.isNotEmpty ?? false){
                return SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Column(
                    children: [

                      ListView.builder(shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          padding: const EdgeInsets.only(
                              top: 16
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ItemListCartOrder(
                              mealData: snapshot.data?.elementAt(index),
                              voidCallback: () {
                                setState(() {

                                });
                              },
                            );
                      }),

                      Container(
                        margin: const EdgeInsets.only(
                            bottom: 10, left: 12, right: 12, top: 14
                        ),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText('Delivery Instructions',
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),

                                    AutoSizeText('+ Add Notes', style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 13, color: AppThemeMode.primaryColor),),

                                  ],
                                ),

                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                                  margin: const EdgeInsets.symmetric(vertical: 14),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: AppThemeMode.containerFieldColor,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: const AutoSizeText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                    style: TextStyle(fontSize: 14),),
                                ),


                                const Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 14
                                  ),
                                  child: Divider(indent: 4, endIndent: 4, thickness: 0.1,),
                                ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 12.0),
                                          child: AutoSizeText('Phone Number',
                                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                                        ),
                                        AutoSizeText('$deliveryPhone'.formatPhoneNumber(),
                                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                                      ],
                                    ),

                                    InkWell(
                                      onTap: () {
                                        context.router.push(const LimitedMapRoute());
                                      },
                                      child: const AutoSizeText('+ Change', style: TextStyle(
                                          fontWeight: FontWeight.w500, fontSize: 13, color: AppThemeMode.primaryColor),),
                                    ),

                                  ],
                                ),

                                const Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 14, top: 12
                                  ),
                                  child: Divider(indent: 4, endIndent: 4, thickness: 0.1,),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const AutoSizeText('Delivery Location',
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),

                                    InkWell(
                                      onTap: () {
                                        context.router.push(
                                            LocationPickerRoute(
                                                navigatorSource: true,
                                                voidCallback: (pickedData) {
                                                  if(pickedData != null){

                                                    deliveryPickedData.value = pickedData;

                                                    injector<BlocCart>().getCostsService(
                                                      CostParams(
                                                        clientLocation: ClientLocationParams(
                                                          latitude: pickedData.latLong.latitude,
                                                          longitude: pickedData.latLong.longitude,
                                                        ),
                                                        restaurants: snapshot.data?.map((meal) =>
                                                            RestaurantsParams(restaurantId: meal.restaurantId)
                                                        ).toSet().toList()
                                                      )
                                                    ).forEach((element) {
                                                      if(element.data?.isNotEmpty ?? false){
                                                        deliveryPrice.value = element.data;
                                                      }
                                                    });
                                                  }
                                                }
                                            )
                                        );
                                      },
                                      child: const AutoSizeText('+ Change', style: TextStyle(
                                          fontWeight: FontWeight.w500, fontSize: 13, color: AppThemeMode.primaryColor),),
                                    ),

                                  ],
                                ),

                                ValueListenableBuilder<PickedData?>(
                                    valueListenable: deliveryPickedData,
                                    builder: (context, value, _) {
                                    return Container(
                                      margin: const EdgeInsets.only(top: 14),
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                      width: MediaQuery.of(context).size.width, height: 200,
                                      decoration: BoxDecoration(
                                          color: AppThemeMode.containerFieldColor,
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      child: FlutterMap(
                                        options: MapOptions(
                                          center: LatLng(
                                              value?.latLong.latitude ?? 11,
                                              value?.latLong.longitude ?? 10
                                          ),
                                          zoom: 12,
                                        ),
                                        children: [
                                          TileLayer(
                                            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                            userAgentPackageName: 'com.dmsh.hunger_meal',
                                          ),
                                          MarkerLayer(
                                            markers: [
                                              Marker(
                                                point: LatLng(
                                                    value?.latLong.latitude ?? 11,
                                                    value?.latLong.longitude ?? 10
                                                ),
                                                builder: (context) {
                                                  return const Icon(Icons.location_pin,
                                                      size: 30, color: AppThemeMode.primaryColor);
                                                },
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                ),

                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 14, bottom: 14
                                  ),
                                  child: Divider(indent: 4, endIndent: 4, thickness: 0.1,),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 14
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const AutoSizeText('Sub Total',
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),

                                  AutoSizeText('${calculateTotalPrice(snapshot.data)} DT', style: const TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 16, color: AppThemeMode.primaryColor),),

                                ],
                              ),
                            ),
                            ValueListenableBuilder<List<CostData>?>(
                                valueListenable: deliveryPrice,
                                builder: (context, value, _) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const AutoSizeText('Delivery Cost',
                                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),

                                        AutoSizeText('${calculateDeliveryPrice(value)} DT', style: const TextStyle(
                                            fontWeight: FontWeight.w600, fontSize: 16, color: AppThemeMode.primaryColor),),

                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 14, bottom: 14
                                      ),
                                      child: Divider(indent: 4, endIndent: 4, thickness: 0.1,),
                                    )
                                  ],
                                );
                              }
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 12
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const AutoSizeText('Total',
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),

                                  AutoSizeText('${calculateTotalPrice(snapshot.data)} DT', style: const TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 16, color: AppThemeMode.primaryColor),),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      DefaultActionButton(
                        isLoading: false,
                        colorButton: AppThemeMode.secondaryColor,
                        textColor: AppThemeMode.thirdColor,
                        textButton: "Order Now",
                        onClickCallback: () {
                          showDialog(context: context, barrierDismissible: false, builder: (_) => const Center(
                            child: SpinKitCircle(size: 75, color: AppThemeMode.thirdColor,),));
                          injector<BlocCart>().setOrderService(
                            getCartParams(snapshot.data, deliveryPrice.value),
                          ).forEach((element) {
                            Navigator.of(context, rootNavigator: true).pop();
                          });
                        },
                      ),

                    ],
                  ),
                );
              }
              return const SizedBox();
          }
        ),
      ),
    );
  }
}
