import 'package:domain/domain.dart';

class LoginModel extends LoginData {

  const LoginModel({
      String? message,
      dynamic code,
  }): super(
    message: message,
    code: code
  );

  factory LoginModel.fromJson(dynamic json) {
    return LoginModel(
        message: json['message'],
        code: json['verification_code'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['verification_code'] = code;
    return map;
  }

}