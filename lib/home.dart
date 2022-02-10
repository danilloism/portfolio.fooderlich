import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/pages/pages.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final pages = <Widget>[
    const ExplorePage(),
    const RecipesPage(),
    const GroceryPage(),
  ];

  //final _pageController = PageController();

  @override
  Widget build(BuildContext context) => Consumer<TabManager>(
        builder: (context, tabManager, child) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Fooderlich',
            ),
          ),
          //TODO:: replace body
          body: IndexedStack(
            index: tabManager.selectedTab,
            children: pages,
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: tabManager.selectedTab,
            onDestinationSelected: (index) => tabManager.goToTab(index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.explore),
                label: "Explore",
              ),
              NavigationDestination(
                icon: Icon(Icons.book),
                label: "Recipes",
              ),
              NavigationDestination(
                icon: Icon(Icons.list),
                label: "To Buy",
              ),
            ],
          ),
        ),
      );
}
