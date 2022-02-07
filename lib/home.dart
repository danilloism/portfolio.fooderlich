import 'package:flutter/material.dart';
import 'package:fooderlich/pages/pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  static final pages = <Widget>[
    const ExplorePage(),
    const RecipesPage(),
    const GroceryPage(),
  ];

  void _onItemChanged(int index) => setState(() {
        _selectedIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Fooderlich',
      //   ),
      // ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onItemChanged,
        children: pages,
      ),

      bottomNavigationBar: NavigationBar(
        //selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
          );
        },
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
    );
  }
}
