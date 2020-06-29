import 'package:flutter/cupertino.dart';
import 'package:my_flutter/pages/detail/meal_detail.dart';
import 'package:my_flutter/pages/main/main.dart';
import 'package:my_flutter/pages/meal/meal.dart';

class Router {
  static final String initialRoute = MainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainScreen.routeName : (context) => MainScreen(),
    MealPage.routeName : (context) => MealPage(),
    MealDetailPage.routeName : (context) => MealDetailPage()
  };
}