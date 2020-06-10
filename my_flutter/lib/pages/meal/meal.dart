import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/core/model/category_model.dart';
import 'package:my_flutter/pages/meal/meal_content.dart';

class MealPage extends StatelessWidget {
  static const String routeName = "/meal";

  @override
  Widget build(BuildContext context) {
    CategoryModel model = ModalRoute.of(context).settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: MealContent(),
    );
  }
}