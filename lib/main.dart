import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/category_meals_screen.dart';

import 'screens/categories_screen.dart';
import 'screens/meal_deatil_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontWeight: FontWeight.bold))),
      // home은 app의 root screen
      home: TabsScreen(),
      // routing 기능.

      // key-value mapping으로 특정 widget에 접근할 수 있음.
      // Navigator.of(context).pushNamed를 이용해 key의 String으로 widget에 접근가능..
      routes: {
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen()
      },
      // onGenerateRoute는 pushNamed를 이용할 때 routes table에 등록되지 않은 route에 대해 처리한다.
      // dynamic한 application을 만들 때 사용하는 것을 고려해볼 만함.
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      // onUnknowRoute는 위의 수단을 모두 사용했음에도 불구하고 routing에 실패했을 때 실행된다.
      // error를 던지기 전에 onUnknownRoute에 정의되어 있는 routing을 실행함.
      // webpage의 404 페이지와 비슷하다고 생각하면됨.
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
