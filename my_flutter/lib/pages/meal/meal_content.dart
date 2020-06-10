import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/core/model/category_model.dart';
import 'package:my_flutter/core/model/meal_model.dart';
import 'package:my_flutter/core/services/meal_manage.dart';
import 'package:my_flutter/pages/meal/meal_item.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class MealContent extends StatefulWidget {
  @override
  _MealContentState createState() => _MealContentState();
}

class _MealContentState extends State<MealContent> {
  @override
  Widget build(BuildContext context) {
    //as 转成相对应的model
    //ModalRoute.of 永远拿的是顶层的路由，
    final category = ModalRoute.of(context).settings.arguments as CategoryModel;

    return Selector<MealPageManage, List<MealModel>>(
      selector: (context, model) {
        return model.meals.where((meal) {
          return meal.categories.contains(category.id);
        }).toList();
      },
      shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
      builder: (context, meals, child) {
        return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return MealItem(meals[index]);
            }
        );
      },
    );
  }
}