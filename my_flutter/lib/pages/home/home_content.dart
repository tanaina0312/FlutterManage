import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/core/extension/int_extention.dart';
import 'package:my_flutter/core/model/category_model.dart';
import 'package:my_flutter/core/services/json_parse.dart';
import 'package:my_flutter/pages/home/view/home_item.dart';
class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: JsonParse.getCategoryData(),
      builder: (context, snapshot){
        if(!snapshot.hasData)  return Center(child: CircularProgressIndicator());
        if(snapshot.error != null)  return Center(child: Text("request error"),);

        final category = snapshot.data;
        return GridView.builder(
          scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(20),
            itemCount: category.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.5
            ),
            itemBuilder: (context, index){
              CategoryModel model = category[index];
              if(model == null) return null;
              return HomeItem(model);
            }
        );
      },
    );
  }
}
