import 'package:domain/domain.dart';

class UserModel extends UserData {

  const UserModel({
    int? id,
    String? username,
    String? firstname,
    String? lastname,
    String? email,
    int? roleId,
    String? address,
    String? city,
    String? image,
    String? phone,
    String? state,
    int? zoneId,
  }): super(
      id: id,
      username: username,
      firstname: firstname,
      lastname: lastname,
      email: email,
      roleId: roleId,
      address: address,
      city: city,
      image: image,
      phone: phone,
      state: state,
      zoneId: zoneId
  );

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
        id: json['id'],
        username: json['username'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        roleId: json['role_id'],
        address: json['address'],
        city: json['city'],
        image: json['image'],
        phone: json['phone'],
        state: json['state'],
        zoneId: json['zone_id'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['email'] = email;
    map['role_id'] = roleId;
    map['address'] = address;
    map['city'] = city;
    map['image'] = image;
    map['phone'] = phone;
    map['state'] = state;
    map['zone_id'] = zoneId;
    return map;
  }

}