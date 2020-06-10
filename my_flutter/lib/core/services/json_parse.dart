import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_flutter/core/model/category_model.dart';

class JsonParse {
  static Future<List<CategoryModel>> getCategoryData() async {
    print(rootBundle);
    // 1.加载json文件
    final jsonString = await rootBundle.loadString("assets/json/category.json");

    // 2.将jsonString转成Map/List
    final result =  json.decode(jsonString);

    // 3.将Map中的内容转成一个个对象
    final resultList = result["category"];
    List<CategoryModel> categories = [];
    for (var json in resultList) {
      categories.add(CategoryModel.fromJson(json));
    }
    return categories;
  }
}