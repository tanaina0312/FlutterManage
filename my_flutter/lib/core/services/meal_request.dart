import 'package:my_flutter/core/model/meal_model.dart';
import 'package:my_flutter/core/services/http_request.dart';

class MealRequest {
  static Future<List<MealModel>> getMealData() async{
    final String url = "/meal";
    final result = await HttpRequest.request(url);

    // 2.json转modal
    final mealArray = result["meal"];
    List<MealModel> meals = [];
    for (var json in mealArray) {
      meals.add(MealModel.fromJson(json));
    }
    return meals;
  }
}