
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/repositories/client/category_repository.dart';

class GetZonesUseCase implements UseCaseDefault<DataState<List<ZoneAddressData>?>> {

  final UserRepository _userRepository;
  GetZonesUseCase(this._userRepository);

  @override
  Future<DataState<List<ZoneAddressData>?>> call() {
    return _userRepository.getZonesAction();
  }

}