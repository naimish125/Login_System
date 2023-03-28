import 'package:flutter/material.dart';

class IntroProvider extends ChangeNotifier {
  bool isLastPage = false;
  List imageList = [
    "assets/images/7.jpg",
    "assets/images/8.jpg",
  ];

  void lastPage(int index) {
    isLastPage = index == 2;
    notifyListeners();
  }
}