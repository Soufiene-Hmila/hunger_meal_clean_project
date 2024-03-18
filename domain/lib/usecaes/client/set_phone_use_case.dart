
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/entities/client/login_data.dart';
import 'package:domain/repositories/client/category_repository.dart';
import 'package:domain/repositories/client/user_repository.dart';

class SetPhoneUseCase implements UseCase<DataState<LoginData?>, PhoneParams> {

  final UserRepository _userRepository;
  SetPhoneUseCase(this._userRepository);

  @override
  Future<DataState<LoginData?>> call({PhoneParams? params}) {
    return _userRepository.setPhoneAction(params);
  }

}