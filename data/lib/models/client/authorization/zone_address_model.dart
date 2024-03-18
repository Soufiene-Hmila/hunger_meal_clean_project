import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class ZoneAddressModel extends ZoneAddressData {

  const ZoneAddressModel({
    int? id,
    String? name,
    String? latitude,
    String? longitude,
    int? perimeter,
  }): super(
    id: id,
    name: name,
    latitude: latitude,
    longitude: longitude,
    perimeter: perimeter,
  );

  factory ZoneAddressModel.fromJson(dynamic json) {
    return ZoneAddressModel(
      id: json['id'],
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      perimeter: json['perimeter'],
    );
  }

  @override
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


}
