

import 'package:data/models/client/meals/meal_model.dart';
import 'package:data/models/client/restaurant/response_data.dart';
import 'package:domain/domain.dart';

class MealResponse {

  MealData? mealData;

  MealResponse({
    this.mealData,
  });

  factory MealResponse.fromJson(dynamic json) {
    return MealResponse(
        mealData: json['meal'] != null ? MealModel.fromJson(json['meal']) : null
    );
  }


}