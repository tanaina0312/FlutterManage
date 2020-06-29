import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/core/model/meal_model.dart';
import 'package:my_flutter/pages/detail/meal_detail_content.dart';

class MealDetailPage extends StatelessWidget {
  static const String routeName = "/detail";
  @override
  Widget build(BuildContext context) {
    final MealModel model = ModalRoute.of(context).settings.arguments as MealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: MealDetailContent(model),
    );
  }
}
