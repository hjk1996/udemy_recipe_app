import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // typo를 방지하기 위해서 route name을 class variable로 설정해주는 것이 좋음.
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late String categoryId;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  // initState는 context가 형성되기 전에 먼저 실행되므로 didChangeDependencies를 사용한다.
  // didChangeDependencies는 initState 이후 context는 형성됐지만 build는 call 되기 이전 시점이다.
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
// routeArgs를 통해 전달받은 argument에 접근할 수 있음.
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      categoryId = routeArgs['id'] as String;
      // id(category)를 통해 list를 필터링함.
      displayedMeals = widget.availableMeals.where((meal) {
        // meal의 categories list에 categoryId 값이 포함되어있는지 확인함.
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          final meal = displayedMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
            removeFromFavoritesScreen: () {},
          );
        }),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
