import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/core/extension/int_extention.dart';
import 'package:my_flutter/core/model/meal_model.dart';
import 'package:my_flutter/pages/meal/meal_bottom_item.dart';

class MealItem extends StatelessWidget {
  final MealModel mealModel;
  MealItem(this.mealModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
          margin: EdgeInsets.all(20),
          elevation: 5,   //阴影
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              topWidget(),
              bottomWidget()

            ],
          )
      ),
      onTap: (){

      },
    );
  }

  Widget topWidget() {
    return Stack(
      children: [
        //ClipRRect自定义圆角  ClipOval例子(默认全圆角):
        ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12)
          ),
          child: Image.network(mealModel.imageUrl, width: double.infinity, height:250, fit: BoxFit.cover),
        ),
        Positioned(
            right: 10.px,
            bottom: 10.px,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text(mealModel.title,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            )
        )
      ],
    );
  }

  Widget bottomWidget() {
    return Padding(
        padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MealBottomItem("${mealModel.duration}分钟",Icon(Icons.schedule)),
          MealBottomItem("${mealModel.complexStr}",Icon(Icons.restaurant)),
          MealBottomItem("未收藏", Icon(Icons.favorite)),
        ],
      ),
    );
  }
}