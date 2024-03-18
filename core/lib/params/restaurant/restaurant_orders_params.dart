
class RestaurantOrdersParams {

  final int? id;
  final int? params;

  RestaurantOrdersParams({
      this.params,
      this.id,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['params'] = params;
    map['id'] = id;
    return map;
  }

}