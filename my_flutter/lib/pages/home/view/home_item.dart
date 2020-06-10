import 'package:flutter/cupertino.dart';
import 'package:my_flutter/core/model/category_model.dart';
import 'package:my_flutter/pages/meal/meal.dart';

class HomeItem extends StatelessWidget {
  final CategoryModel model;
  HomeItem(this.model);
  
  @override
  Widget build(BuildContext context) {
    Color color = model.cColor;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: model.cColor,
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                colors: [
                  color.withOpacity(.5),
                  color
                ]
            )
        ),
        alignment: Alignment.center,
        child: Text(
          model.title,
        ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(MealPage.routeName, arguments: model);
      },
    );
  }
}
