

import 'package:data/models/client/restaurant/response_data.dart';

class RestaurantsResponse {

  ResponseData? users;

  RestaurantsResponse({
      this.users,
  });

  factory RestaurantsResponse.fromJson(dynamic json) {
    return RestaurantsResponse(
        users: json['users'] != null ? ResponseData.fromJson(json['users']) : null
    );
  }

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   if (users != null) {
  //     map['users'] = users?.toJson();
  //   }
  //   return map;
  // }

}