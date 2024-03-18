
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/entities/client/login_data.dart';
import 'package:domain/repositories/client/category_repository.dart';
import 'package:domain/repositories/client/user_repository.dart';

class SetCostUseCase implements UseCase<DataState<List<CostData>?>, CostParams> {

  final OrderRepository _orderRepository;
  SetCostUseCase(this._orderRepository);

  @override
  Future<DataState<List<CostData>?>> call({CostParams? params}) {
    return _orderRepository.getCostsAction(params);
  }

}