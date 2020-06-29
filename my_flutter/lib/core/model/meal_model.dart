import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'meal_model.g.dart';

List<String> complexes = ["简单", "中等", "困难"];

@JsonSerializable()
class MealModel {
  String id;
  List<String> categories;
  String title;
  int affordability;
  int complexity;
  String complexStr;
  String imageUrl;
  int duration;
  List<String> ingredients;
  List<String> steps;
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;

  MealModel({
    this.id,
    this.categories,
    this.title,
    this.affordability,
    this.complexity,
    this.complexStr,
    this.imageUrl,
    this.duration,
    this.ingredients,
    this.steps,
    this.isGlutenFree,
    this.isVegan,
    this.isVegetarian,
    this.isLactoseFree,
  });

  factory MealModel.fromJson(Map<Object, dynamic> json) => _$MealModelFromJson(json);
  Map<Object, dynamic> toJson() => _$MealModelToJson(this);

//  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
//    id: json["id"],
//    categories: List<String>.from(json["categories"].map((x) => x)),
//    title: json["title"],
//    affordability: json["affordability"],
//    complexity: json["complexity"],
//    complexStr: complexes[json["complexity"]],
//    imageUrl: json["imageUrl"],
//    duration: json["duration"],
//    ingredients: List<String>.from(json["ingredients"].map((x) => x)),
//    steps: List<String>.from(json["steps"].map((x) => x)),
//    isGlutenFree: json["isGlutenFree"],
//    isVegan: json["isVegan"],
//    isVegetarian: json["isVegetarian"],
//    isLactoseFree: json["isLactoseFree"],
//  );
//
//  Map<String, dynamic> toJson() => {
//    "id": id,
//    "categories": List<dynamic>.from(categories.map((x) => x)),
//    "title": title,
//    "affordability": affordability,
//    "complexity": complexity,
//    "imageUrl": imageUrl,
//    "duration": duration,
//    "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
//    "steps": List<dynamic>.from(steps.map((x) => x)),
//    "isGlutenFree": isGlutenFree,
//    "isVegan": isVegan,
//    "isVegetarian": isVegetarian,
//    "isLactoseFree": isLactoseFree,
//  };
}
