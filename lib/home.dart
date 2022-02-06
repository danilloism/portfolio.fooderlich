import 'package:flutter/material.dart';
import 'package:fooderlich/pages/pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final PageController controller = PageController();

  static final List<Widget> pages = <Widget>[
    const ExplorePage(),
    const RecipesPage(),
    Container(color: Colors.blue),
  ];

  void _onItemTapped(int index) => setState(() {
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
        controller: controller,
        onPageChanged: _onItemTapped,
        children: pages,
      ),

      bottomNavigationBar: NavigationBar(
        //selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
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
