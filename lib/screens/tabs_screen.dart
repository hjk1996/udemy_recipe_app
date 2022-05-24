import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/favorites_screen.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map> _pages = [
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": FavoritesScreen(), "title": "Your Favorites"}
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // DefaultTabController를 이용해서 탭 화면을 만들 수 있음.
    // DefaultTabController를 이용하면 appbar와 body 영역이 서로 상호작용할 수 있음.
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
      ),
      // 옆에서 슬라이딩 되는 햄버거 메뉴
      drawer: MainDrawer(),
      // TabBarView의 children의 순서는 AppBar에 있는 TabBar의 children의 순서와 같아야한다.
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        // BottomNavigationBar는 함수에 item의 index를 값으로 전달해줌.
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        // currentIndex 값을 통해 탭에서 몇번째 아이템이 선택되었나 나타낼 수 있음.
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        // type을 통해 탭이 선택됐을 때의 애니메이션을 정할 수 있음.
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: "Favorites",
          )
        ],
      ),
    );
  }
}
