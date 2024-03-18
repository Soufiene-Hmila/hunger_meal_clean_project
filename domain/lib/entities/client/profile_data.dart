import 'package:equatable/equatable.dart';

class ProfileData extends Equatable {

  final int? id;
  final String? username;
  final String? firstname;
  final String? lastname;
  final String? email;
  final dynamic emailVerifiedAt;
  final int? roleId;
  final dynamic address;
  final dynamic city;
  final dynamic registrationNumber;
  final dynamic image;
  final String? phone;
  final String? state;
  final int? zoneId;
  final dynamic createdAt;
  final String? updatedAt;
  final dynamic phoneNumberVerifiedAt;
  final dynamic verificationCode;
  final int? entryNumbers;
  final dynamic verificationCodeSentAt;

  const ProfileData({
      this.id, 
      this.username, 
      this.firstname, 
      this.lastname, 
      this.email, 
      this.emailVerifiedAt, 
      this.roleId, 
      this.address, 
      this.city, 
      this.registrationNumber, 
      this.image, 
      this.phone, 
      this.state, 
      this.zoneId, 
      this.createdAt, 
      this.updatedAt, 
      this.phoneNumberVerifiedAt, 
      this.verificationCode, 
      this.entryNumbers, 
      this.verificationCodeSentAt,
  });

  factory ProfileData.fromJson(dynamic json) {
    return ProfileData(
        id: json['id'],
        username: json['username'],
        firstname : json['firstname'],
        lastname : json['lastname'],
        email : json['email'],
        emailVerifiedAt : json['email_verified_at'],
        roleId : json['role_id'],
        address : json['address'],
        city : json['city'],
        registrationNumber : json['registration_number'],
        image : json['image'],
        phone : json['phone'],
        state : json['state'],
    zoneId : json['zone_id'],
    createdAt : json['created_at'],
    updatedAt : json['updated_at'],
    phoneNumberVerifiedAt : json['phone_number_verified_at'],
    verificationCode : json['verification_code'],
    entryNumbers : json['entry_numbers'],
    verificationCodeSentAt : json['verification_code_sent_at'],
    );

  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['role_id'] = roleId;
    map['address'] = address;
    map['city'] = city;
    map['registration_number'] = registrationNumber;
    map['image'] = image;
    map['phone'] = phone;
    map['state'] = state;
    map['zone_id'] = zoneId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['phone_number_verified_at'] = phoneNumberVerifiedAt;
    map['verification_code'] = verificationCode;
    map['entry_numbers'] = entryNumbers;
    map['verification_code_sent_at'] = verificationCodeSentAt;
    return map;
  }

  @override
  List<Object?> get props => [
    id,
    username,
    firstname,
    lastname,
    email,
    emailVerifiedAt,
    roleId,
    address,
    city,
    registrationNumber,
    image,
    phone,
    state,
    zoneId,
    createdAt,
    updatedAt,
    phoneNumberVerifiedAt,
    verificationCode,
    entryNumbers,
    verificationCodeSentAt,
  ];

}