import 'package:flutter/material.dart';
import 'package:my_flutter/core/model/meal_model.dart';

class FavoriteManage extends ChangeNotifier {
  List<MealModel> _favorites = [];

  void _addFavorite(MealModel model) {
    _favorites.add(model);
    notifyListeners();
  }

  void _removeFavorite(MealModel model) {
    if(_favorites.contains(model)) {
      _favorites.remove(model);
      notifyListeners();
    }
  }

  void handelFavorite(MealModel mealModel) {
    if(isFavorite(mealModel)){
      _removeFavorite(mealModel);
    }else{
      _addFavorite(mealModel);
    }
  }

  bool isFavorite(MealModel mealModel) {
    return _favorites.contains(mealModel);
  }
}