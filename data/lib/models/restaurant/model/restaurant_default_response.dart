class RestaurantDefaultResponse {

  String? message;

  RestaurantDefaultResponse({
      this.message,
  });

  factory RestaurantDefaultResponse.fromJson(dynamic json) {
    return RestaurantDefaultResponse(
        message: json['message']
    );

  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}