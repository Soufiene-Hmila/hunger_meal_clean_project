class ClientLocationParams {

  final dynamic latitude;
  final dynamic longitude;

  ClientLocationParams({
      this.latitude, 
      this.longitude,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }

}