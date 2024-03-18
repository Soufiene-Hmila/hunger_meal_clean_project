import 'package:data/models/client/authorization/user_model.dart';
import 'package:domain/entities/client/user_data.dart';
import 'package:domain/entities/client/verification_data.dart';
import 'package:equatable/equatable.dart';

class VerificationModel extends VerificationData {


  const VerificationModel({
    UserData? user,
    String? accessToken,
    int? role,
    bool toAddInformation = false,
    String? tokenType,
  }): super(
    user: user,
    accessToken: accessToken,
    role: role,
    toAddInformation: toAddInformation,
    tokenType: tokenType
  );

  factory VerificationModel.fromJson(dynamic json) {
    return VerificationModel(
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      accessToken: json['access_token'],
      role: json['role'],
      toAddInformation: json['to_add_information'],
      tokenType: json['token_type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['access_token'] = accessToken;
    map['role'] = role;
    map['to_add_information'] = toAddInformation;
    map['token_type'] = tokenType;
    return map;
  }

}
