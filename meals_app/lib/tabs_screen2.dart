import 'package:flutter/material.dart';
import './category_screen.dart';
import './favourite_screen.dart';
import './main_drawer.dart';
import './models/meal.dart';

class TabsScreenS extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreenS(this.favouriteMeals);
  @override
  _TabsScreenSState createState() => _TabsScreenSState();
}

class _TabsScreenSState extends State<TabsScreenS> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {'title': 'Categories', 'page': CategoriesScreen()},
      {'title': 'Favourites', 'page': FavouriteScreen(widget.favouriteMeals)},
    ];
    super.initState();
  }

  int selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: selectedPageIndex,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Categories"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text("Favourites"),
            ),
          ]),
    );
  }
}
