
import 'package:core/params/client/order/location_params.dart';

class ClientParams {

  final int? clientId;
  final LocationParams? clientLocation;

  ClientParams({
      this.clientId, 
      this.clientLocation,
  });

  factory ClientParams.fromJson(dynamic json) {
    return ClientParams(
        clientId: json['client_id'],
        clientLocation: json['client_location'] != null
            ? LocationParams.fromJson(json['client_location']) : null
    );

  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_id'] = clientId;
    if (clientLocation != null) {
      map['client_location'] = clientLocation?.toJson();
    }
    return map;
  }

}