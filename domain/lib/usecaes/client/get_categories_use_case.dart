
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/repositories/client/category_repository.dart';

class GetCategoriesUseCase implements UseCaseDefault<DataState<List<CategoryData>?>> {

  final CategoryRepository _categoryRepository;
  GetCategoriesUseCase(this._categoryRepository);

  @override
  Future<DataState<List<CategoryData>?>> call() {
    return _categoryRepository.getCategoriesAction();
  }

}