
import 'package:domain/entities/client/user_data.dart';
import 'package:equatable/equatable.dart';

class LoginData extends Equatable {

  final String? message;
  final dynamic code;

  const LoginData({
      this.message,
      this.code,
  });

  @override
  List<Object?> get props => [
    message,
    code,
  ];

}