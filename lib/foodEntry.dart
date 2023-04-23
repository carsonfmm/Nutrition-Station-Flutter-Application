import 'dart:ffi';

import 'package:group8/foodItem.dart';

import 'foodItem.dart';

class FoodEntry{
  FoodItem item;
  double servings;

  String get units => servings == 1 ? item.singular : item.plural;
  double get totalCal => servings * item.calories;

  FoodEntry({required this.item, required this.servings});

}