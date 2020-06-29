import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/core/router/router.dart';
import 'package:my_flutter/core/services/favourite_manage.dart';
import 'package:my_flutter/core/services/meal_manage.dart';
import 'package:my_flutter/shared/app_theme.dart';
import 'package:my_flutter/shared/size_fit.dart';
import 'package:provider/provider.dart';

void main() {
  // Provider -> ViewModel/Provider/Consumer(Selector)
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create:(context) => MealPageManage()),
          ChangeNotifierProvider(create:(context) => FavoriteManage()),
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize();

    return MaterialApp(
      theme: AppTheme.norTheme,
      initialRoute: Router.initialRoute,
      routes: Router.routes,
    );
  }
}

