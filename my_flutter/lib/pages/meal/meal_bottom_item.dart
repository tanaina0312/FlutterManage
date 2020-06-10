import 'package:flutter/material.dart';
import 'package:my_flutter/core/extension/int_extention.dart';

class MealBottomItem extends StatelessWidget {
  final String title;
  final Widget icon;
  MealBottomItem(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        this.icon,
        SizedBox(width: 3.px),
        Text(title)
      ],
    );
  }
}