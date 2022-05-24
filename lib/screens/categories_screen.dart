import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';
import '../models/food_category.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        ...DUMMY_CATEGORIES.map((c) => CategoryItem(
              id: c.id,
              title: c.title,
              color: c.color,
            ))
      ],
      // gridDelegate가 layout에 관한 역할을 전담해서 함.
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // device의 width가 414인 경우,
        // max: 150 -> 300(=150 x2) < 414 / 450(=150 x3) > 414 = 1행에 그리드박스 3개
        // max: 200 -> 400(=200 x2) < 414 / 600(=200 x3) > 414 = 1행에 그리드박스 3개
        // max: 220 -> 440(=220 x2) > 414 = 1행에 그리드박스 2개
        // max: 400 -> 800(=400 x2) > 414 = 1행에 그리드박스 2개
        // max: 420 -> 420(=420 x1) > 414 = 1행에 그리드박스 1개
        maxCrossAxisExtent: 200,
        // item의 width (crossAxis)와 height(mainAxis)의 비율.
        // width가 3, height가 2
        childAspectRatio: 3 / 2,
        // column(crossAxis)간 패딩
        crossAxisSpacing: 20,
        // row(mainAxis)간 패딩
        mainAxisSpacing: 20,
      ),
    );
  }
}
