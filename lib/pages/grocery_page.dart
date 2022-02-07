import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/utils.dart';
import 'package:provider/provider.dart';

part 'empty_grocery_page.dart';

class GroceryPage extends StatelessWidget {
  const GroceryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {}, //TODO: Present GroceryItemScreen
      ),
      body: _buildGroceryScreen(),
    );
  }

  Widget _buildGroceryScreen() {
    return Consumer<GroceryManager>(
      builder: (context, manager, child) {
        if (manager.groceryItems.isNotEmpty) {
          //TODO: add GroceryListScreen
          return Container(color: Colors.pink);
        } else {
          return const _EmptyGroceryScreen();
        }
      },
    );
  }
}
