import 'package:flutter/material.dart';

class DashPrrovider with ChangeNotifier{
  int currentIndex = 0;

  void changeIndex(int index){
    currentIndex = index;
    notifyListeners();
  }
}