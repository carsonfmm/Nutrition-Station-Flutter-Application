import 'dart:collection';

import 'package:flutter/cupertino.dart';

import "foodItem.dart";

class FoodItemListModel extends ChangeNotifier{
  final List<FoodItem> _foodItems = [];
  
  UnmodifiableListView<FoodItem> get foodItems => UnmodifiableListView(_foodItems);

  void add(FoodItem a){
    _foodItems.add(a);
    notifyListeners();
  }

  void remove(FoodItem a){
    _foodItems.remove(a);
    notifyListeners();
  }

  void removeAll(FoodItem a){
    _foodItems.clear();
    notifyListeners();
  }
}