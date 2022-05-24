import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({required this.id, required this.title, required this.color});

  void _selectCategory(BuildContext context) {
    // screen 간 navigate
    // page들은 stack으로 관리됨.
    // 따라서 page를 push, pop 할 수 있음.
    // top-most page가 visible page임.
    // arguments는 /category-meals로 라우팅 되어있는 위젯의 context 안에 함께 전달됨.
    // 전달된 argumetns는 ModalRoute.of(context).settings.arguments를 통해 확인 가능.
    // /category-meals로 mapping된 위젯에 argument를 전달.
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    // InkWell widget은 GestureDetector와 InkResponse가 섞인 위젯임
    // 탭하면 위젯 위로 물결 효과가 생김.
    return InkWell(
      onTap: () {
        _selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            // LinearGradient를 통해 색상 그래디언트를 입힐 수 있음.
            gradient: LinearGradient(
              colors: [
                // withOpacity를 통해 기존 Color에 투명도를 더해줄 수 있음.
                color.withOpacity(0.7),
                color,
              ],
              // Gradient color가 시작될 위치
              begin: Alignment.topLeft,
              // Gradient color가 끝날 위치
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
