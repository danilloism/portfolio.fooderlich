import 'dart:async';
import 'package:flutter/material.dart';
import 'app_cache.dart';

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
  final _appCache = AppCache();

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnBoardingComplete => _onBoardingComplete;
  int get setlectedTab => _selectedTab;

  void initializeApp() async {
    _loggedIn = await _appCache.isUserLoggedIn();
    _onBoardingComplete = await _appCache.didCompleteOnboarding();

    Timer(
      const Duration(seconds: 2),
      () {
        _initialized = true;
        notifyListeners();
      },
    );
  }

  void login({required String username, required String password}) async {
    _loggedIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }

  void completeOnBoarding() async {
    _onBoardingComplete = true;
    await _appCache.completeOnboarding();
    notifyListeners();
  }

  void goToTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToRecipes() => goToTab(FooderlichTab.recipes);
  //void goToExplore() => goToTab(FooderlichTab.explore);
  //void goToBuy() => goToTab(FooderlichTab.toBuy);

  void logout() async {
    _initialized = false;
    _selectedTab = 0;
    await _appCache.invalidate();

    initializeApp();
    notifyListeners();
  }
}
