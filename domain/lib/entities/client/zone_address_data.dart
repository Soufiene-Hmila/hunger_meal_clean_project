import 'package:equatable/equatable.dart';

class ZoneAddressData extends Equatable {

  final int? id;
  final String? name;
  final String? latitude;
  final String? longitude;
  final int? perimeter;
  final dynamic createdAt;
  final dynamic updatedAt;

  const ZoneAddressData({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.perimeter,
    this.createdAt,
    this.updatedAt,
  });

  factory ZoneAddressData.fromJson(dynamic json) {
    return ZoneAddressData(
      id: json['id'],
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      perimeter: json['perimeter'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['perimeter'] = perimeter;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

  @override
  List<Object?> get props => [
    id,
    name,
    latitude,
    longitude,
    perimeter,
    createdAt,
    updatedAt,
  ];
}
