import 'package:flutter/material.dart';
import 'package:fooderlich/components/card.1.dart';
import 'package:fooderlich/components/card.2.dart';
import 'package:fooderlich/components/card.3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static final pages = <Widget>[
    const Card1(),
    const Card2(),
    const Card3(),
  ];

  void _onItemTapped(int index) => setState(() {
        _selectedIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Fooderlich",
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        //selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.card_giftcard),
            label: "Card",
          ),
          NavigationDestination(
            icon: Icon(Icons.card_giftcard),
            label: "Card2",
          ),
          NavigationDestination(
            icon: Icon(Icons.card_giftcard),
            label: "Card3",
          ),
        ],
      ),
    );
  }
}
