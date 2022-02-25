import 'dart:async';
import 'package:flutter/material.dart';

class FooderlichTab {
  static const explore = 0;
  static const recipes = 1;
  static const toBuy = 2;
}

class AppStateManager extends ChangeNotifier {
  var _initialized = false;
  var _loggedIn = false;
  var _onBoardingComplete = false;
  var _selectedTab = FooderlichTab.explore;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnBoardingComplete => _onBoardingComplete;
  int get setlectedTab => _selectedTab;

  void initializeApp() {
    Timer(
      const Duration(seconds: 2),
      () {
        _initialized = true;
        notifyListeners();
      },
    );
  }

  void login({required String username, required String password}) {
    _loggedIn = true;
    notifyListeners();
  }

  void completeOnBoarding() {
    _onBoardingComplete = true;
    notifyListeners();
  }

  void goToTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToRecipes() => goToTab(FooderlichTab.recipes);
  //void goToExplore() => goToTab(FooderlichTab.explore);
  //void goToBuy() => goToTab(FooderlichTab.toBuy);

  void logout() {
    _loggedIn = false;
    _onBoardingComplete = false;
    _initialized = false;
    _selectedTab = 0;

    initializeApp();
    notifyListeners();
  }
}
