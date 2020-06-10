import 'package:flutter/material.dart';
import 'package:my_flutter/pages/favor/favor.dart';
import 'package:my_flutter/pages/home/home_page.dart';

final List<Widget> pages = [
  HomePage(),
  FavorPage()
];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
  BottomNavigationBarItem(icon: Icon(Icons.star), title: Text("收藏")),

];