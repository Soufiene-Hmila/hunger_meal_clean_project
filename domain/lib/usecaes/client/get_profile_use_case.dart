
import 'package:core/core.dart';
import 'package:domain/entities/client/profile_data.dart';
import 'package:domain/repositories/client/user_repository.dart';

class GetProfileUseCase implements UseCase<DataState<ProfileData?>, int> {

  final UserRepository _userRepository;
  GetProfileUseCase(this._userRepository);

  @override
  Future<DataState<ProfileData?>> call({int? params}) {
    return _userRepository.getProfileAction(params);
  }

}