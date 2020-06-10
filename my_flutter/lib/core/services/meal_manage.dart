import 'package:flutter/material.dart';
import 'package:my_flutter/core/model/meal_model.dart';
import 'package:my_flutter/core/services/meal_request.dart';

class MealPageManage extends ChangeNotifier {
  List<MealModel> _meals = [];

  List<MealModel> get meals {
    return _meals;
  }

  MealPageManage() {
    MealRequest.getMealData().then((response) {
      _meals = response;
      notifyListeners();
    });
  }
}