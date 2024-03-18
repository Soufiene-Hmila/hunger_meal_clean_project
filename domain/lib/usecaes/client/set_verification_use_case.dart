
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/entities/client/login_data.dart';
import 'package:domain/entities/client/verification_data.dart';
import 'package:domain/repositories/client/category_repository.dart';
import 'package:domain/repositories/client/user_repository.dart';

class SetVerificationUseCase implements UseCase<DataState<VerificationData?>, VerificationParams> {

  final UserRepository _userRepository;
  SetVerificationUseCase(this._userRepository);

  @override
  Future<DataState<VerificationData?>> call({VerificationParams? params}) {
    return _userRepository.setVerificationAction(params);
  }

}