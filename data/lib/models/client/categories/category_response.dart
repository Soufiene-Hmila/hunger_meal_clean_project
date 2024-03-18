

import 'package:data/models/client/categories/category_model.dart';
import 'package:data/models/client/meals/meal_model.dart';
import 'package:domain/domain.dart';

class CategoryResponse {

  CategoryData? category;

  CategoryResponse({
    this.category,
  });

  factory CategoryResponse.fromJson(dynamic json) {
    return CategoryResponse(
        category: json['category'] != null ? CategoryModel.fromJson(json['category']) : null,
    );
  }

}