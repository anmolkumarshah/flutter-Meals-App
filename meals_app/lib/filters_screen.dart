import 'package:flutter/material.dart';
import './main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilter;
  FiltersScreen(this.currentFilter, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluteneFree = false;

  var _vegetarian = false;

  var _vegan = false;

  var _lactoseFree = false;

  @override
  initState() {
    _gluteneFree = widget.currentFilter['glutene'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    _lactoseFree = widget.currentFilter['lactose'];

    super.initState();
  }

  Widget _buildSwitchTileView(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilter = {
                  'glutene': _gluteneFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilter);
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Adjust Your Meal Selection",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchTileView('Lactose Free',
                  "Only Include Lactose-Free Meal", _lactoseFree, (newvalue) {
                setState(() {
                  _lactoseFree = newvalue;
                });
              }),
              _buildSwitchTileView(
                  'Gluten Free', "Only Include Gluten-Free Meal", _gluteneFree,
                  (newvalue) {
                setState(() {
                  _gluteneFree = newvalue;
                });
              }),
              _buildSwitchTileView(
                  'Vegetarian', "Only Include Vegetarian Meal", _vegetarian,
                  (newvalue) {
                setState(() {
                  _vegetarian = newvalue;
                });
              }),
              _buildSwitchTileView('Vegan', "Only Include Vegan Meal", _vegan,
                  (newvalue) {
                setState(() {
                  _vegan = newvalue;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
