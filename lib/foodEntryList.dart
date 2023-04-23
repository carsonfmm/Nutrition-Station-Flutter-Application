import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'foodEntry.dart';
import "foodItem.dart";

class FoodEntryListModel extends ChangeNotifier{
  final List<FoodEntry> _foodEntries = [];
  
  UnmodifiableListView<FoodEntry> get foodEntries => UnmodifiableListView(_foodEntries);

  double getTotalCal(){
    double retVal = 0;
    foodEntries.forEach((e) => retVal+=e.totalCal);
    return retVal;
  }

  void add(FoodEntry a){
    _foodEntries.add(a);
    notifyListeners();
  }

  void remove(FoodEntry a){
    _foodEntries.remove(a); 
    notifyListeners();
  }

  void removeAll(){
    _foodEntries.clear();
    notifyListeners();
  }
}