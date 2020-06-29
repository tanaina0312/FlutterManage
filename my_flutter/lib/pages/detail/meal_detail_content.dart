import 'package:flutter/material.dart';
import 'package:my_flutter/core/model/meal_model.dart';
import 'package:my_flutter/core/services/favourite_manage.dart';
import 'package:provider/provider.dart';

class MealDetailContent extends StatefulWidget {
  final MealModel mealModel;
  MealDetailContent(this.mealModel);

  @override
  _MealDetailContentState createState() => _MealDetailContentState();
}

class _MealDetailContentState extends State<MealDetailContent> {
  @override
  Widget build(BuildContext context) {
    MealModel model = widget.mealModel;
    return Scaffold(
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  //第一部分
                  headerPart(model),
                  SizedBox(height: 12),
                  //第二部分
                  middlePart(model),
                  //第三部分
                  bottomPart(model)
                ],
              );
            }
        ),
        floatingActionButton: Consumer<FavoriteManage>(
            builder: (context, favorite, child){
              IconData iconData = favorite.isFavorite(model) ? Icons.favorite : Icons.favorite_border;
              return FloatingActionButton(
                  child: Icon(iconData),
                  onPressed: (){
                    favorite.handelFavorite(model);
                  }
              );
            }
        )
    );
  }

  Widget headerPart(MealModel model) {
    return Container(
      width: double.infinity,
      height: 240,
      child: Image.network(model.imageUrl, fit: BoxFit.cover),
    );
  }

  Widget middlePart(MealModel model) {
    return Column(
      children: [
        Text(
          "制作",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
          padding: EdgeInsets.only( bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: model.ingredients.length,
              itemBuilder: (context, index){
                String content = model.ingredients[index];
                return Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Colors.orange,
                    ),
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 8, left: 12, right: 12),
                    child: Text(content, style: TextStyle(color: Colors.white, fontSize: 15),)
                );
              }
          ),
        )
      ],
    );
  }

  Widget bottomPart(MealModel model) {
    return Column(
      children: [
        Text(
          "制作步骤",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
          padding: EdgeInsets.only( bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: model.steps.length,
              itemBuilder: (context, index){
                String content = "${model.steps[index]} baby";
                return Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 8, left: 12, right: 12),
                    child: Text("${index + 1}" + "、" + "$content", style: TextStyle(color: Colors.black, fontSize: 15),)
                );
              }
          ),
        )
      ],
    );
  }
}