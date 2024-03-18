
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/repositories/client/category_repository.dart';

class GetCategoryUseCase implements UseCase<DataState<CategoryData?>, int?> {

  final CategoryRepository _categoryRepository;
  GetCategoryUseCase(this._categoryRepository);

  @override
  Future<DataState<CategoryData?>> call({int? params}) {
    return _categoryRepository.getCategoryAction(params);
  }

}