//{
//"category.json": [
//{
//"id": "c1",
//"title": "意大利",
//"color": "9C27B0"
//},

import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String title;
  String color;

  Color cColor;

  CategoryModel({this.id, this.title, this.color});

  CategoryModel.fromJson(Map<String, dynamic> map) {
    this.id = map["id"];
    this.title = map["title"];
    this.color = map["color"];

    // 1.将color转成十六进制的数字
    final colorInt = int.parse(color, radix: 16);
    // 2.将透明度加进去
    cColor = Color(colorInt | 0xFF000000);
  }

}