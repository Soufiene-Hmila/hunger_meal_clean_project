class LocationParams {

  final String? country;
  final String? state;
  final String? city;
  final String? address;
  final String? zip;
  final double? latitude;
  final double? longitude;

  LocationParams({
    this.country,
    this.state,
    this.city,
    this.address,
    this.zip,
    this.latitude,
    this.longitude,
  });

  factory LocationParams.fromJson(dynamic json) {
    return LocationParams(
      country: json['country'],
      state: json['state'],
      city: json['city'],
      address: json['address'],
      zip: json['zip'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['state'] = state;
    map['city'] = city;
    map['address'] = address;
    map['zip'] = zip;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }
}
