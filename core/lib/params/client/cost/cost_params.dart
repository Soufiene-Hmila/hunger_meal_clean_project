
import 'package:core/params/client/cost/client_location_params.dart';
import 'package:core/params/client/cost/restaurants_params.dart';

class CostParams {

  final ClientLocationParams? clientLocation;
  final List<RestaurantsParams>? restaurants;

  CostParams({
      this.clientLocation, 
      this.restaurants,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (clientLocation != null) {
      map['client_location'] = clientLocation?.toJson();
    }
    if (restaurants != null) {
      map['restaurants'] = restaurants?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}