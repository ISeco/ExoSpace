import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {

  int _currentPage = 0;
  PageController _pageController = PageController();

  int get currentPage => _currentPage;

  set currentPage( int valor ) {

    _currentPage = valor;

    _pageController.animateToPage(
      valor,
      duration: const Duration( milliseconds: 250 ),
      curve: Curves.easeOut
    );

    notifyListeners();
  }

  PageController get pageController => _pageController;

}