import 'package:flutter/material.dart';
import './main_drawer.dart';
import './category_screen.dart';
import './favourite_screen.dart';
import './models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Meals"),
            bottom: TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favourite",
              ),
            ]),
          ),
          body: TabBarView(children: <Widget>[
            CategoriesScreen(),
            FavouriteScreen(widget.favouriteMeals)
          ]),
          drawer: MainDrawer(),
        ));
  }
}
