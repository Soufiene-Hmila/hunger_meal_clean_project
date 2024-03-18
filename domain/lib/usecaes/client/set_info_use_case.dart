
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/entities/client/login_data.dart';
import 'package:domain/entities/client/verification_data.dart';
import 'package:domain/repositories/client/category_repository.dart';
import 'package:domain/repositories/client/user_repository.dart';

class SetInfoUseCase implements UseCase<DataState<dynamic>, InfoParams> {

  final UserRepository _userRepository;
  SetInfoUseCase(this._userRepository);

  @override
  Future<DataState<dynamic>> call({InfoParams? params}) {
    return _userRepository.setInfoAction(params);
  }

}