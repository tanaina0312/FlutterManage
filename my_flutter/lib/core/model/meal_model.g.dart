// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealModel _$MealModelFromJson(Map<String, dynamic> json) {
  return MealModel(
      id: json['id'] as String,
      categories:
          (json['categories'] as List)?.map((e) => e as String)?.toList(),
      title: json['title'] as String,
      affordability: json['affordability'] as int,
      complexity: json['complexity'] as int,
      complexStr: json['complexStr'] as String,
      imageUrl: json['imageUrl'] as String,
      duration: json['duration'] as int,
      ingredients:
          (json['ingredients'] as List)?.map((e) => e as String)?.toList(),
      steps: (json['steps'] as List)?.map((e) => e as String)?.toList(),
      isGlutenFree: json['isGlutenFree'] as bool,
      isVegan: json['isVegan'] as bool,
      isVegetarian: json['isVegetarian'] as bool,
      isLactoseFree: json['isLactoseFree'] as bool);
}

Map<String, dynamic> _$MealModelToJson(MealModel instance) => <String, dynamic>{
      'id': instance.id,
      'categories': instance.categories,
      'title': instance.title,
      'affordability': instance.affordability,
      'complexity': instance.complexity,
      'complexStr': instance.complexStr,
      'imageUrl': instance.imageUrl,
      'duration': instance.duration,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
      'isGlutenFree': instance.isGlutenFree,
      'isVegan': instance.isVegan,
      'isVegetarian': instance.isVegetarian,
      'isLactoseFree': instance.isLactoseFree
    };
