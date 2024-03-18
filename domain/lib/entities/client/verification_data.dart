import 'package:domain/entities/client/user_data.dart';
import 'package:equatable/equatable.dart';

class VerificationData extends Equatable {

  final UserData? user;
  final String? accessToken;
  final int? role;
  final bool toAddInformation;
  final String? tokenType;

  const VerificationData({
    this.user,
    this.accessToken,
    this.role,
    this.toAddInformation = false,
    this.tokenType,
  });

  factory VerificationData.fromJson(dynamic json) {
    return VerificationData(
      user: json['user'] != null ? UserData.fromJson(json['user']) : null,
      accessToken: json['access_token'],
      role: json['role'],
      toAddInformation: json['to_add_information'],
      tokenType: json['token_type'],
    );
  }

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

  @override
  List<Object?> get props => [
        user,
        accessToken,
        role,
        toAddInformation,
        tokenType,
      ];
}
