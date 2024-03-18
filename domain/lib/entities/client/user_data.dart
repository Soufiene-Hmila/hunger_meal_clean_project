import 'package:equatable/equatable.dart';

class UserData extends Equatable {

  final int? id;
  final String? username;
  final String? firstname;
  final String? lastname;
  final String? email;
  final int? roleId;
  final String? address;
  final String? city;
  final String? image;
  final String? phone;
  final String? state;
  final int? zoneId;
  final String? verificationCode;
  final int? entryNumbers;

  const UserData({
    this.id,
    this.username,
    this.firstname,
    this.lastname,
    this.email,
    this.roleId,
    this.address,
    this.city,
    this.image,
    this.phone,
    this.state,
    this.zoneId,
    this.verificationCode,
    this.entryNumbers,
  });

  factory UserData.fromJson(dynamic json) {
    return UserData(
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
      verificationCode: json['verification_code'],
      entryNumbers: json['entry_numbers'],
    );
  }

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

    map['verification_code'] = verificationCode;
    map['entry_numbers'] = entryNumbers;
    return map;
  }

  @override
  List<Object?> get props => [
        id,
        username,
        firstname,
        lastname,
        email,
        roleId,
        address,
        city,
        image,
        phone,
        state,
        zoneId,
        verificationCode,
        entryNumbers,
      ];
}
