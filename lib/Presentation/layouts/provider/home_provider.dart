import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
    int homeTapIndex = 0;
  changeHomeTapIndex(int newVal) {
    if (homeTapIndex == newVal) return;
    homeTapIndex = newVal;
    notifyListeners();
  }
}
